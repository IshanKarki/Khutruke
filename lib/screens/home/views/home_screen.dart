import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:khutruke/screens/add_expense/views/new_transaction.dart';
import 'package:khutruke/screens/home/views/profile_screen.dart';
// import 'dart:math';
import 'goal_screen.dart';
import 'package:khutruke/screens/home/views/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Your screens
  final List<Widget> _screens = [MainScreen(), GoalScreen(), ProfileScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.square_split_2x2_fill),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.flame_fill),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_fill),
            label: 'Profile',
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: _screens[_selectedIndex],
    );
  }
}
