import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final String imageUrl = 'assets/photo.png'; // Image from assets
  final String userName = 'Dhaval Bhagora';
  final String mobileNumber = '+91 8*******95';
  final String location = 'Chotila, Gujarat';
  final int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Profile Image in a Circle
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage(imageUrl), // Load image from assets
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              SizedBox(width: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.person, color: Colors.amber),
                  SizedBox(width: 8),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              SizedBox(width: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.phone, color: Colors.amber),
                  SizedBox(width: 8),
                  Text(
                    mobileNumber,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              SizedBox(height: 5),

              // Location
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Colors.amber),
                  SizedBox(width: 8),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              ),
              SizedBox(height: 5),

              // Age
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.cake, color: Colors.amber),
                  SizedBox(width: 8),
                  Text(
                    'Age: $age',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
