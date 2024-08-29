import 'package:flutter/material.dart';

class Reversenum extends StatefulWidget {
  @override
  _ReversenumState createState() => _ReversenumState();
}

class _ReversenumState extends State<Reversenum> {
  TextEditingController _controller = TextEditingController();
  String _reversedNumber = '';

  void _reverseNumber() {
    String input = _controller.text;
    setState(() {
      _reversedNumber = input.split('').reversed.join('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reverse Number Converter'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.numbers,
                  color: Colors.blue,
                ),
                hintText: "Enter Number",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _reverseNumber,
                child: Text('Reverse'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white)),
            SizedBox(height: 20),
            Text(
              'Reverse Number:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              ' $_reversedNumber',
              style: TextStyle(fontSize: 30, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
