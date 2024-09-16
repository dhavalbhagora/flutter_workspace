import 'package:flutter/material.dart';
import 'package:module_4/61.Account.dart';
import 'package:module_4/61.Cart.dart';
import 'package:module_4/61.menu.dart';

class menu extends StatefulWidget {
  const menu({
    super.key,
  });

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  List screen = [
    MainScreen(),
    Account(),
    Cartpage(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
      body: screen[selectedIndex],
    );
  }
}
