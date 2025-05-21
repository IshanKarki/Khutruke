import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  color: Colors.grey.shade600,
                  height: MediaQuery.of(context).size.width * 0.5,
                  width: double.infinity,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: -20,
                  child: Image.asset(
                    'assets/oinky_chill.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
