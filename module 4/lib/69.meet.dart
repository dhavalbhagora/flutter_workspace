import 'package:flutter/material.dart';

class Meet extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 175,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'New Metting',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 50,
                    width: 175,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Join Metting',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
