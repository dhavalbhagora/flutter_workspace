import 'package:flutter/material.dart';
import 'package:module_4/69.Send.dart';
import 'package:module_4/69.draft.dart';
import 'package:module_4/69.inbox.dart';
import 'package:module_4/69.meet.dart';

class mail extends StatefulWidget {
  @override
  _mailState createState() => _mailState();
}

class _mailState extends State<mail> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    InboxScreen(),
    Meet(),
    //    SentScreen(),
    //  DraftsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gmail',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/photo.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text('Draft'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DraftsScreen()),
                );
                // Navigate to Inbox screen
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Send'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SentScreen()),
                );
                // Navigate to Inbox screen
              },
            ),
          ],
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Meet',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

meet() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 175,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'New Metting',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    height: 50,
                    width: 175,
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Join Metting',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
