import 'package:flutter/material.dart';

import 'display_numbers.dart';

class NumberInputScreen extends StatefulWidget {
  @override
  _NumberInputScreenState createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  final _startController = TextEditingController();
  final _endController = TextEditingController();

  void _submitNumbers() {
    final int? start = int.tryParse(_startController.text);
    final int? end = int.tryParse(_endController.text);

    if (start == null || end == null) {
      // Show error if input is invalid
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter valid numbers.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    // Navigate to display numbers screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => DisplayNumbersScreen(start: start, end: end),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Input'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _startController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Start Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
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
            TextField(
              controller: _endController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'End Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
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
              onPressed: _submitNumbers,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
