import 'package:database_basic/Custom_Widgets/myDrawer.dart';
import 'package:database_basic/db/db.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyDbHelper myDbHelper = MyDbHelper.instance;
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController c_name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: MyColors.orangeDivider,
        title: Text(
          "Create And Store Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Form(
        key: formGlobalKey,
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(children: [
            TextFormField(
              controller: c_name,
              decoration: InputDecoration(hintText: "Enter Your Category"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter category name';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                if (formGlobalKey.currentState!.validate()) {
                  insert();
                }
              },
              child: Text("Add"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: MyColors.primaryColor,
                  foregroundColor: Colors.black),
            ),
          ]),
        ),
      ),
    );
  }

  void insert() async {
    Map<String, dynamic> row = {MyDbHelper.catname: c_name.text.toString()};

    print('insert stRT');

    final id = await myDbHelper.insert(row);
    print('inserted row id: $id');
    c_name.text = "";
  }
}
