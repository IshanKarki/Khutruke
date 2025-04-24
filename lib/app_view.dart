import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khutruke',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          surface: Colors.grey.shade100,
          onSurface: Colors.black,
          primary: const Color(0xFFAA00FF),
          secondary: const Color(0xFFFF00AA),
          tertiary: const Color.fromARGB(255, 255, 159, 99),
          outline: const Color.fromARGB(255, 99, 99, 99),
        ),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
