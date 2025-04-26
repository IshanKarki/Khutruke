import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'goal_screen.dart';
import 'package:khutruke/screens/home/views/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var widgetList = [MainScreen(), StatScreen(), GoalScreen()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      // ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          backgroundColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.square_split_2x2_fill),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.flame_fill),
              label: 'Analytics',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 8,
        shape: const CircleBorder(),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: GradientRotation(pi / 4),
            ),
          ),
          child: Icon(CupertinoIcons.add),
        ),
      ),
      body: index == 0 ? MainScreen() : GoalScreen(),
    );
  }
}
