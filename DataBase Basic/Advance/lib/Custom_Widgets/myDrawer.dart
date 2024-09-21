import 'package:database_basic/Colors.dart';
import 'package:database_basic/Screen/Add_Contact.dart';
import 'package:flutter/material.dart';

import '../Screen/Contact.dart';
import '../main.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: MyColors.drawalBackground,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 15,
            ),
            ListTile(
              title: const Text(
                'Add Category',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => MyApp()));
              },
            ),
            Divider(
              color: MyColors.drawalDivider,
              height: 2,
              thickness: 2,
            ),
            ListTile(
              title: const Text(
                'Add Contact',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AddContact()));
              },
            ),
            Divider(
              color: MyColors.drawalDivider,
              height: 2,
              thickness: 2,
            ),
            ListTile(
              title: const Text(
                'Contact List',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Contact()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
