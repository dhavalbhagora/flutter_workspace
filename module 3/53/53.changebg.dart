import 'dart:math';

import 'package:flutter/material.dart';

class Changebg extends StatefulWidget {
  const Changebg({super.key});

  @override
  State<Changebg> createState() => _ChangebgState();
}

class _ChangebgState extends State<Changebg> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color(Random().nextInt(0xffffffff));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background Changer'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: Text('Change Background Color'),
          ),
        ),
      ),
    );
  }
}
