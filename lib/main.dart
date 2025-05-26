import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'app.dart';
//backend
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> _signInAnonymously() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    await FirebaseAuth.instance.signInAnonymously();
    print('Signed in anonymously.');
  } else {
    print('Already signed in: ${user.uid}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async before runApp
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _signInAnonymously();
  runApp(const MyApp());
}
