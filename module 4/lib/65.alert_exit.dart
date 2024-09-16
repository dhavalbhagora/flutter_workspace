import 'package:flutter/material.dart';

class alertdialog_exit extends StatefulWidget {
  @override
  _alertdialog_exitState createState() => _alertdialog_exitState();
}

class _alertdialog_exitState extends State<alertdialog_exit> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await _showExitConfirmationDialog(context);
        return shouldExit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Exit Alert'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Text(
            'Press the back button to exit',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Exit Application'),
              content: Text('Are you sure you want to exit the application?'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text('Cancel'),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white)),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Exit'),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white),
                ),
              ],
            );
          },
        )) ??
        false;
  }
}
