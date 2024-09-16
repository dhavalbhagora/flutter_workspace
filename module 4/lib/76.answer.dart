import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int sum;

  // Constructor to receive the sum from the previous screen
  ResultScreen({required this.sum});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          'The sum is: ${widget.sum}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
