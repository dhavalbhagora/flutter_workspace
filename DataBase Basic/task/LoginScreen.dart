import 'package:database_task/Database/db.dart';
import 'package:database_task/second.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScereen extends StatefulWidget {
  const LoginScereen({super.key});

  @override
  State<LoginScereen> createState() => _LoginScereenState();
}

class _LoginScereenState extends State<LoginScereen> {
  TextEditingController _pass1 = TextEditingController();
  TextEditingController _email1 = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  MyDbHelper myDbHelper = MyDbHelper.instance;
  List<Map<String, dynamic>> allData = [];
  late SharedPreferences sharedPreferences;
  late bool newuser = false;

  @override
  void initState() {
    super.initState();
    checklogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login'),
      ),
      body: Center(
        child: Column(
          children: [
            Form(
                key: formGlobalKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.greenAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: 'First Name',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                      controller: _email1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email';
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
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: 'password',
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      ),
                      controller: _pass1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'pass';
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String mail = _email1.text.toString();
                        var pass = _pass1.text.toString();
                        final com = await myDbHelper.getUser(mail, pass);
                        if (com != null) {
                          await _saveLogin(mail);
                          //User found

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Secondpage()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Successful")),
                          );
                        } else {
                          // User not found
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text("Invalid Email or Password")),
                          );
                        }
                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.red),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<void> checklogin() async {
    sharedPreferences = await SharedPreferences.getInstance();

    newuser = (sharedPreferences.getBool('mylogin') ?? true);
    print(newuser);

    if (newuser == true) {
      Navigator.pushReplacement(
          context, new MaterialPageRoute(builder: (context) => Secondpage()));
    }
  }

  Future<void> _saveLogin(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('mylogin', true);
    await prefs.setString('email', email);
  }
}
