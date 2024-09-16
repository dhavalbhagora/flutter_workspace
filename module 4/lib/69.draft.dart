import 'package:flutter/material.dart';

class DraftsScreen extends StatefulWidget {
  const DraftsScreen({super.key});

  @override
  State<DraftsScreen> createState() => _DraftsScreenState();
}

class _DraftsScreenState extends State<DraftsScreen> {
  List mails = [
    'Prakruti Vyas',
  ];
  List mail_sub = [
    'Mam Please Upload today class Work in Git',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Draft'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: mails.length,
              itemBuilder: (context, index) {
                final mail = mails[index];
                final sub = mail_sub[index];
                return ListTile(
                  leading: Icon(Icons.drafts, color: Colors.red),
                  title: Text('$mail'),
                  subtitle: Text('$sub'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
