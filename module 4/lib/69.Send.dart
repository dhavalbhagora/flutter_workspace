import 'package:flutter/material.dart';

class SentScreen extends StatefulWidget {
  const SentScreen({super.key});

  @override
  State<SentScreen> createState() => _SentScreenState();
}

class _SentScreenState extends State<SentScreen> {
  List mails = [
    'Sujal Khunt',
    'TOPS TECHNOLOGY',
    'Amazone',
    'Yogesh Gojiya',
  ];
  List mail_sub = [
    'Thanks for sending Code... ',
    'TOPS TECHNOLOGY for Extends Laves...',
    'Return wrong product...',
    'Congratulation...',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Sent'),
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
                  leading: Icon(Icons.send, color: Colors.red),
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
