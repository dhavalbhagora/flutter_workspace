import 'package:flutter/material.dart';

class CheckBoxTextHome extends StatefulWidget {
  @override
  _CheckBoxTextHomeState createState() => _CheckBoxTextHomeState();
}

class _CheckBoxTextHomeState extends State<CheckBoxTextHome> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Text Display'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  activeColor: Colors.blue,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Text('Show Text'),
              ],
            ),
            SizedBox(height: 20),
            _isChecked
                ? Text(
                    'Checkbox is checked ',
                    style: TextStyle(fontSize: 24),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
