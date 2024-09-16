import 'package:flutter/material.dart';

class gallery extends StatefulWidget {
  const gallery({super.key});

  @override
  State<gallery> createState() => _galleryState();
}

class _galleryState extends State<gallery> {
  int myindex = 0;
  List<Widget> Widgetlist = [
    _gallery(),
    _audio(),
    _video(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Widgetlist[myindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
        currentIndex: myindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album),
              label: 'gallery',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.audio_file),
              label: 'Audio',
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_file),
              label: 'Video',
              backgroundColor: Colors.green),
        ],
      ),
    );
  }
}

class _video extends StatelessWidget {
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
    // TODO: implement build
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: link.length,
        itemBuilder: (BuildContext context, int index) {
          final path = link;
          return Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.green, width: 2),
              ),
              child: Center(
                child: Image.asset(
                  '${path[index]}',
                  fit: BoxFit.cover,
                  height: 182,
                  width: 182,
                ),
              ));
        });
  }
}

class _audio extends StatelessWidget {
  List<String> title = [
    'song 1 for ',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
  ];
  List<String> subtitle = [
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
    'song1',
  ];

  // Constructor to pass data to the ListTile

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: title.length,
        itemBuilder: (context, index) {
          final song = title;
          final sub = subtitle;
          return ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text(song[index]),
            subtitle: Text('Subtitle ${sub[index]}'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {},
          );
        },
      ),
    );
  }
}

class _gallery extends StatelessWidget {
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
    // TODO: implement build

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: link.length,
        itemBuilder: (BuildContext context, int index) {
          final path = link;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              '${path[index]}',
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
