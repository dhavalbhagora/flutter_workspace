import 'package:flutter/material.dart';

class audio extends StatefulWidget {
  const audio({super.key});

  @override
  State<audio> createState() => _audioState();
}

class _audioState extends State<audio> {
  List<String> title = [
    'Honey Singh Non Stop',
    '90s Old songs',
    'Party Song Non Stop',
    'Gujarati Dandiya Special',
    'Gujarati 3 tali',
    'Titodo',
    'chill night drive lofi',
    'Slow revers love songs',
    'Hanuman chalisha ',
    'shershaah all song',
    '2012 Bluetooth hit songs',
  ];
  List<String> subtitle = [
    '30:54',
    '65:12',
    '63:55',
    '55:48',
    '15:45',
    '18:53',
    '30:45',
    '9:45',
    '10:58 ',
    '23:23',
    '70:23',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Audio File',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: title.length,
          itemBuilder: (context, index) {
            final song = title;
            final sub = subtitle;
            return Container(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.play_arrow,
                      color: Colors.blue,
                    ),
                    title: Text(song[index]),
                    subtitle: Text('Duration ${sub[index]}'),
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.star_border_outlined,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
