import 'package:flutter/material.dart';
import 'package:module_4/76.answer.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Text controllers to capture user input
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  @override
  void dispose() {
    _num1Controller.dispose();
    _num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Input Numbers'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter th First Number',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue), // Blue border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0), // Blue border when focused
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter th Second Number',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue), // Blue border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0), // Blue border when focused
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Get the numbers from the text fields
                int num1 = int.parse(_num1Controller.text);
                int num2 = int.parse(_num2Controller.text);
                int sum = num1 + num2;

                // Navigate to ResultScreen and pass the sum
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(sum: sum),
                  ),
                );
              },
              child: Text('Calculate Sum'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
