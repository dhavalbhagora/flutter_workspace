import 'package:flutter/material.dart';
import 'package:module_4/71.audio.dart';
import 'package:module_4/71.photos.dart';
import 'package:module_4/71.video.dart';

class navigationDrawer extends StatefulWidget {
  const navigationDrawer({super.key});

  @override
  State<navigationDrawer> createState() => _navigationDrawerState();
}

class _navigationDrawerState extends State<navigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation Drawer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                padding: EdgeInsets.only(top: 76, right: 110),
                child: Column(
                  children: [
                    Text(
                      'Navigation Drawer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  leading: Icon(
                    Icons.photo,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => gallery()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Audio',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  leading: Icon(
                    Icons.audiotrack,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => audio()),
                    );
                  },
                ),
                ListTile(
                  title: Text(
                    'Video',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward,
                    color: Colors.blue,
                  ),
                  leading: Icon(
                    Icons.video_camera_back,
                    color: Colors.blue,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => video()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
