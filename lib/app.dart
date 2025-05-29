import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:khutruke/firebase_options.dart';
import 'package:khutruke/src/auth_screen.dart';
import 'app_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await dotenv.load();

    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } on FirebaseException catch (e) {
      if (e.code != 'duplicate-app') {
        rethrow; // Only rethrow if it's not the duplicate error
      }
      // else: safely ignore duplicate-app error
    }

    // final user = FirebaseAuth.instance.currentUser;
    // if (user == null) {
    //   // await FirebaseAuth.instance.signInAnonymously();
    //   await Navigator.of(
    //     context,
    //   ).push(MaterialPageRoute(builder: (_) => AuthScreen()));
    // }

    await FirebaseAuth.instance.signOut();

    setState(() => _isReady = true);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return Center(child: CircularProgressIndicator());
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }

          final user = snapshot.data;

          return user == null ? AuthScreen() : MyAppView();
        },
      ),
    );
  }
}
