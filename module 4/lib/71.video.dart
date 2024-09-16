import 'package:flutter/material.dart';

class video extends StatefulWidget {
  const video({super.key});

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  List<String> link = [
    'assets/tops.jpeg',
    'assets/image1.jpeg',
    'assets/photo.png',
    'assets/image2.jpeg',
    'assets/image3.jpeg',
    'assets/image4.jpeg',
    'assets/image5.jpeg',
    'assets/image6.jpeg',
    'assets/image7.jpeg',
    'assets/image8.jpeg',
    'assets/image9.jpeg',
    'assets/image10.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Videos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: link.length,
          itemBuilder: (BuildContext context, int index) {
            final path = link;
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    '${path[index]}',
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(padding: EdgeInsets.only(top: 100)),
                  Icon(
                    Icons.play_circle_filled,
                    color: Colors.blue,
                    size: 50,
                  )
                ],
              ),
            );
          }),
    );
  }
}
