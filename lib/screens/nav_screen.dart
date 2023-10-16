import 'package:flutter/material.dart';
import 'package:food_recipe/res/custom_color.dart';
import 'package:food_recipe/screens/home_screen.dart';
import 'package:food_recipe/screens/message_screen.dart';
import 'package:food_recipe/screens/profile_screen.dart';
import 'package:flutter/src/widgets/icon.dart' as icon;

class NavScreen extends StatefulWidget {
  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        selectedItemColor: Color.fromARGB(190, 136, 191, 168),
        unselectedItemColor: CustomColor.grey,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: icon.Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: icon.Icon(Icons.mail),
            label: 'Messages',
          ),
          new BottomNavigationBarItem(
              icon: icon.Icon(Icons.person), label: 'Profile')
        ],
      ),
    );
  }
}
