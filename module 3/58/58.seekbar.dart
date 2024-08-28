import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seekbar'),
      ),
      body: Container(
        color: Color.fromRGBO(
            redValue.toInt(), greenValue.toInt(), blueValue.toInt(), 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: redValue,
              min: 0,
              max: 255,
              divisions: 255,
              label: redValue.round().toString(),
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  redValue = value;
                });
              },
            ),
            Slider(
              value: greenValue,
              min: 0,
              max: 255,
              divisions: 255,
              label: greenValue.round().toString(),
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  greenValue = value;
                });
              },
            ),
            Slider(
              value: blueValue,
              min: 0,
              max: 255,
              divisions: 255,
              label: blueValue.round().toString(),
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  blueValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
