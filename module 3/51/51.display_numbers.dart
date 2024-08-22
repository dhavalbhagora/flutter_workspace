import 'package:flutter/material.dart';

class DisplayNumbersScreen extends StatelessWidget {
  final int start;
  final int end;

  DisplayNumbersScreen({required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    List<int> numbers = [];
    for (int i = start; i < end - 1; i++) {
      numbers.add(i + 1);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers Between $start and $end'),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(
              numbers[index].toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30.00),
            ),
          );
        },
      ),
    );
  }
}
