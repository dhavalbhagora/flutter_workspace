import 'package:database_basic/Add_data.dart';
import 'package:database_basic/edit.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map> slist = [];
  DbHelper db = DbHelper();

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();

    db.open();
    fetchData();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DB Example"),
      ),
      body: SingleChildScrollView(
          child: Column(
              children: slist.map((tops) {
        return Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text(tops["name"]),
            subtitle: Text("Email:" +
                tops["email"].toString() +
                ", Password: " +
                tops["password"]),
            trailing: Wrap(
              children: [
                IconButton(
                    onPressed: () {
                      String email = tops["email"].toString();
                      print(email);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditData(email: email)));
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      db.db.rawDelete(
                          "Delete from info where email=?", [tops["email"]]);
                      print("Deleted");
                      fetchData();
                    },
                    icon: Icon(Icons.delete)),
              ],
            ),
          ),
        );
      }).toList())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => AddData()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void getdata() async {
    Future.delayed(Duration(milliseconds: 500), () async {
      slist = await db.db.rawQuery('SELECT * FROM info');
      setState(() {});
    });
  }

  void fetchData() async {
    final Database db = await openDatabase(
      join(await getDatabasesPath(), 'emp.db'),
    );
    Future.delayed(Duration(milliseconds: 500), () async {
      slist = await db.rawQuery('SELECT * FROM info');
      setState(() {
        this.slist = slist;
      });
    });
  }
}
