import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class alertdialog_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog with Button'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ShowAlertDialog(context),
          child: Text('Show Alert'),
          style: TextButton.styleFrom(
              backgroundColor: Colors.blue, foregroundColor: Colors.white),
        ),
      ),
    );
  }

  void ShowAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose an Option'),
          content: Text('Select an action from the options below:'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showToast("Positive button clicked");
              },
              child: Text('Positive'),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showToast("Neutral button clicked");
              },
              child: Text('Neutral'),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _showToast("Negative button clicked");
                },
                child: Text('Negative'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white)),
          ],
        );
      },
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
