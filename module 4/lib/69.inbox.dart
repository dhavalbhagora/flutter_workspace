import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  List mails = [
    'Sujal Khunt',
    'TOPS TECHNOLOGY',
    'Amazone',
    'Yogesh Gojiya',
    'Gmail Security',
    'Google Drive',
    'TOPS TECHNOLOGY',
    'Flipkart',
    'Github',
    'Gmail Security'
  ];
  List mail_sub = [
    'hello ,this is content of dummy email ',
    'TOPS TECHNOLOGY IT training center',
    'Hurry up claim your discount coupon',
    'hello Dhaval see my portfolio site  ',
    'Your password was change recently see updates...',
    'Your drive getting full upgrade with our plan...',
    'Your registration is successfully done !',
    'Big billion day coming soon...',
    'Click bellow link for change your password...',
    'Click hear to see where your mail loged in...'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mails.length,
      itemBuilder: (context, index) {
        final mail = mails[index];
        final sub = mail_sub[index];
        return Column(
          children: [
            ListTile(
              leading: Icon(Icons.email, color: Colors.red),
              title: Text('$mail'),
              subtitle: Text('$sub'),
              trailing: Icon(Icons.star_border_outlined),
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            )
          ],
        );
      },
    );
  }
}
