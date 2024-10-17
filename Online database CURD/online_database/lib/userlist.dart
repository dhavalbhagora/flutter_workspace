import 'dart:async';

import 'package:flutter/material.dart';
import 'package:online_database/homepage.dart';
import 'package:online_database/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class spalshscreen extends StatefulWidget {
  const spalshscreen({super.key});

  @override
  State<spalshscreen> createState() => _spalshscreenState();
}

class _spalshscreenState extends State<spalshscreen> {
  static const String KEYLOGIN = 'login';

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 2), () {
      // After 3 seconds, navigate to the home screen
      WhereGoTO();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/image.png'), // Your splash image
      ),
    );
  }

  void WhereGoTO() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Delay for splash screen
    await Future.delayed(Duration(seconds: 2));

    if (isLoggedIn) {
      // If logged in, redirect to HomeScreen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      // If not logged in, redirect to LoginScreen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }
}
