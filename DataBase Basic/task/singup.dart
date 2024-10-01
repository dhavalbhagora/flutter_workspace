import 'package:database_task/Database/db.dart';
import 'package:database_task/second.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _email = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  MyDbHelper myDbHelper = MyDbHelper.instance;
  late SharedPreferences sharedPreferences;
  late bool newuser = false;

  @override
  void initState() {
    // TODO: implement
    super.initState();
    checklogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sing up'),
      ),
      body: Center(
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'First Name',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                controller: _firstName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter First Name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'Last Name',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                controller: _lastName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Last Name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'Enter Email',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                  hintText: 'Enter Email',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                ),
                controller: _pass,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formGlobalKey.currentState!.validate()) {
                    _insert();
                  }
                  sharedPreferences.setBool('myname', true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Secondpage()));
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _insert() async {
    Map<String, dynamic> row = {
      myDbHelper.columnName: _firstName.text.toString(),
      myDbHelper.columnLName: _lastName.text.toString(),
      myDbHelper.columnEmail: _email.text.toString(),
      myDbHelper.columnpass: _pass.text.toString(),
    };

    final id = await myDbHelper.insertContact(row);
    if (kDebugMode) {
      print('inserted row id: $id');
    }
  }

  Future<void> checklogin() async {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('myname') ?? false);
    print(newuser);

    if (newuser == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Secondpage()));
    }
  }
}
