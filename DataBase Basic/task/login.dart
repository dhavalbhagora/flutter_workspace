import 'package:database_task/LoginScreen.dart';
import 'package:database_task/second.dart';
import 'package:database_task/singup.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Database'),
          backgroundColor: Colors.red,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => Secondpage()));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Singup()));
                  },
                  child: Text('Sing up')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScereen()));
                  },
                  child: Text('Login')),
            ],
          ),
        ));
  }
}
