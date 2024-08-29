import 'package:flutter/material.dart';

class ColorSelectorHome extends StatefulWidget {
  @override
  _ColorSelectorHomeState createState() => _ColorSelectorHomeState();
}

class _ColorSelectorHomeState extends State<ColorSelectorHome> {
  Color _backgroundColor = Colors.white;
  String _selectedColor = 'White';

  void _handleColorChange(String? color) {
    setState(() {
      _selectedColor = color!;
      switch (color) {
        case 'Red':
          _backgroundColor = Colors.red;
          break;
        case 'Green':
          _backgroundColor = Colors.green;
          break;
        case 'Blue':
          _backgroundColor = Colors.blue;
          break;
        case 'Yellow':
          _backgroundColor = Colors.yellow;
          break;
        case 'Orange':
          _backgroundColor = Colors.orange;
          break;
        case 'Pink':
          _backgroundColor = Colors.pink;
          break;
        default:
          _backgroundColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Change"),
        backgroundColor: _backgroundColor,
      ),
      body: Container(
        color: _backgroundColor,
        child: Column(
          children: [
            const Text(
              'Select a color:',
              style: TextStyle(fontSize: 24),
            ),
            ListTile(
              title: const Text(
                'Red',
                style: TextStyle(
                    color: Colors.red,
                    backgroundColor: Colors.white,
                    fontSize: 20),
              ),
              leading: Radio<String>(
                value: 'Red',
                groupValue: _selectedColor,
                onChanged: _handleColorChange,
              ),
            ),
            ListTile(
              title: const Text(
                'Green',
                style: TextStyle(
                    color: Colors.green,
                    backgroundColor: Colors.white,
                    fontSize: 20),
              ),
              leading: Radio<String>(
                value: 'Green',
                groupValue: _selectedColor,
                onChanged: _handleColorChange,
              ),
            ),
            ListTile(
              title: const Text(
                'Blue',
                style: TextStyle(
                    color: Colors.blue,
                    backgroundColor: Colors.white,
                    fontSize: 20),
              ),
              leading: Radio<String>(
                value: 'Blue',
                groupValue: _selectedColor,
                onChanged: _handleColorChange,
              ),
            ),
            ListTile(
              title: const Text(
                'Yellow',
                style: TextStyle(
                    color: Colors.yellow,
                    backgroundColor: Colors.white,
                    fontSize: 20),
              ),
              leading: Radio<String>(
                value: 'Yellow',
                groupValue: _selectedColor,
                onChanged: _handleColorChange,
              ),
            ),
            ListTile(
              title: const Text(
                'Orange',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.white,
                    fontSize: 20),
              ),
              leading: Radio<String>(
                value: 'Orange',
                groupValue: _selectedColor,
                onChanged: _handleColorChange,
              ),
            ),
            ListTile(
              title: const Text(
                'Pink',
                style: TextStyle(
                    color: Colors.pink,
                    backgroundColor: Colors.white,
                    fontSize: 20),
              ),
              leading: Radio<String>(
                value: 'Pink',
                groupValue: _selectedColor,
                onChanged: _handleColorChange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
