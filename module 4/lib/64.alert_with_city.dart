import 'package:flutter/material.dart';

class alertdialog_city extends StatefulWidget {
  @override
  _alertdialog_cityState createState() => _alertdialog_cityState();
}

class _alertdialog_cityState extends State<alertdialog_city> {
  String _selectedCity = "Select a city";

  final List<String> _cities = [
    'Rajkot',
    'Ahmedabad',
    'Surat',
    'Jamnagar',
    'Bhavnagar',
    'Vadodara',
    'Morbi',
    'Junagadh',
    'Dwarka',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City Selector'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedCity,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showCitySelectionDialog(context),
              child: Text('Select City'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCitySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? _tempSelectedCity = _selectedCity;

        return AlertDialog(
          title: Text('Choose a city'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _cities.map((city) {
                    return RadioListTile<String>(
                      title: Text(city),
                      value: city,
                      activeColor: Colors.blue,
                      groupValue: _tempSelectedCity,
                      onChanged: (String? value) {
                        setState(() {
                          _tempSelectedCity = value!;
                        });
                      },
                    );
                  }).toList(),
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _selectedCity = _tempSelectedCity!;
                });
                Navigator.of(context).pop();
              },
              child: Text('OK'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
