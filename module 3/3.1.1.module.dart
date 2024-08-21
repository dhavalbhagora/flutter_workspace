import 'package:flutter/material.dart';

class module_3_1 extends StatefulWidget {
  const module_3_1({super.key});

  @override
  State<module_3_1> createState() => _module_3_1State();
}

class _module_3_1State extends State<module_3_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.red,
                    width: 382.00,
                    height: 175.00,
                  ),
                  //SizedBox(width: 20.00,),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 15.00)),
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    width: 182.50,
                    height: 182.00,
                  ),
                  SizedBox(
                    width: 15.00,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 182.50,
                    height: 182.00,
                  ),
                  //SizedBox(width: 20.00,),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 15.00)),
              Row(
                children: [
                  Container(
                    color: Colors.blue,
                    width: 182.50,
                    height: 182.00,
                  ),
                  SizedBox(
                    width: 15.00,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 182.50,
                    height: 182.00,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 15.00)),
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 120.50,
                    height: 150.00,
                  ),
                  SizedBox(
                    width: 11.00,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 120.50,
                    height: 150.00,
                  ),
                  SizedBox(
                    width: 11.00,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 118.50,
                    height: 150.00,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 15.00)),
              Row(
                children: [
                  Container(
                    color: Colors.yellow,
                    width: 120.50,
                    height: 150.00,
                  ),
                  SizedBox(
                    width: 11.00,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 120.50,
                    height: 150.00,
                  ),
                  SizedBox(
                    width: 11.00,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 118.50,
                    height: 150.00,
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
