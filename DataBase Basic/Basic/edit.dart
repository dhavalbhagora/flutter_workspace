import 'package:flutter/material.dart';

import 'db.dart';
import 'main.dart';

class EditData extends StatefulWidget {
  late String email;
  EditData({required this.email});
  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late DbHelper db = DbHelper();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // super.initState();
    db.open();

    Future.delayed(Duration(milliseconds: 500), () async {
      var data = await db.getstudent(widget.email);
      if (data != null) {
        name.text = data["name"];
        email.text = data["email"].toString();
        password.text = data["password"];
        setState(() {});
      } else {
        print("No any data with Email : " + widget.email.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Page ${widget.email}"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(hintText: "Enter Firstname"),
            ),
            SizedBox(height: 50),
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Enter email"),
            ),
            SizedBox(height: 50),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: "Enter password"),
            ),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  String n = name.text.toString();
                  String e = email.text.toString();
                  String p = password.text.toString();

                  db.db.rawUpdate(
                      "update students set name =?,email=?,password=? where email=?",
                      [name, email, password, widget.email]);
                  //db.db.rawInsert("insert into students (fname,lname,email) values (?,?,?)",[name,surname,email1]);
                  print("updated");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
