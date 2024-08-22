import 'package:flutter/material.dart';

class FontSizeScreen extends StatefulWidget {
  @override
  _FontSizeScreenState createState() => _FontSizeScreenState();
}

class _FontSizeScreenState extends State<FontSizeScreen> {
  double _fontSize = 20.0; // Initial font size

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0; // Increase font size by 2
    });
  }

  void _decreaseFontSize() {
    setState(() {
      if (_fontSize > 10.0) {
        // Minimum font size limit
        _fontSize -= 2.0; // Decrease font size by 2
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Font Size'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello Flutter',
              style: TextStyle(fontSize: _fontSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decreaseFontSize,
                  child: Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _increaseFontSize,
                  child: Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
