import 'package:flutter/material.dart';
import 'package:module_3/50.reversenum.dart';
import 'package:module_3/51.twonumber.dart';
import 'package:module_3/52.radiobutton.dart';
import 'package:module_3/53.changebg.dart';
import 'package:module_3/54.fontsize.dart';
import 'package:module_3/55.checkbox.dart';
import 'package:module_3/56.iamge_around.dart';
import 'package:module_3/57.screenradio.dart';
import 'package:module_3/58.seekbar.dart';
import 'package:module_3/59.login.dart';
import 'package:module_3/60.ui.dart';
import 'package:module_3/60.ui2.dart';
import 'package:module_3/module_3_1.dart';
import 'package:module_3/module_3_1_2.dart';

void main() {
  runApp(MaterialApp(
    home: allprogram(),
    debugShowCheckedModeBanner: false,
  ));
}

class allprogram extends StatefulWidget {
  const allprogram({super.key});

  @override
  State<allprogram> createState() => _allprogramState();
}

class _allprogramState extends State<allprogram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Module 3',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => module_3_1()),
                    );
                  },
                  child: Text('49(i) Color Container'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OeschinenLakeCampground()),
                    );
                  },
                  child: Text('49(ii) Oeschinen Lake'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reversenum()),
                    );
                  },
                  child: Text('50 Reverse Number Converter'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NumberInputScreen()),
                    );
                  },
                  child: Text('51 Number Range'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => radiobutton()),
                    );
                  },
                  child: Text('52 RadioButton'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Changebg()),
                    );
                  },
                  child: Text('53 Background Change'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FontSizeScreen()),
                    );
                  },
                  child: Text('54 FontSize + -'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckBoxTextHome()),
                    );
                  },
                  child: Text('55 CheckBox'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => images4()),
                    );
                  },
                  child: Text('56 Image around text'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ColorSelectorHome()),
                    );
                  },
                  child: Text('57 Color Selector'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ColorChanger()),
                    );
                  },
                  child: Text('58 Color Changer'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login()),
                    );
                  },
                  child: Text('59 login'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RestaurantMenuScreen()),
                    );
                  },
                  child: Text('60(i) RestaurantMenu'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white)),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FoodDetailsScreen()),
                    );
                  },
                  child: Text('60(ii) Food Detail'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  )),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
