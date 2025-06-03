import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:khutruke/app.dart';
import 'package:khutruke/app_view.dart';
// import 'package:khutruke/screens/home/views/home_screen.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthScreen({super.key});

  Future<void> _signInWithEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => MyAppView()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Register the user if not found
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else if (e.code == 'wrong-password') {
        // Show error to user
        print("Wrong password");
      } else {
        print("Email Sign-in Error: ${e.message}");
      }
    }
  }

  Future<void> _signUpWithEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print("User signed up, login to continue!");
    } on FirebaseAuthException catch (e) {
      print("Sign up failed: ${e.code} - ${e.message}");
      throw Exception('Sign up failed: ${e.code} - ${e.message}');
    }
  }

  //currently sign in with Google is not working, see more on that later, Now
  //move forward with saving monthly and daily expense, and updating the expense
  //transactions screen with the added expense by the user in real time.


  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print("Google sign-in cancelled by user");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Optional: Link with anonymous user if already signed in
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.isAnonymous) {
        final result = await currentUser.linkWithCredential(credential);
        print("Anonymous account linked to Google: ${result.user?.email}");
      } else {
        final result = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );
        print("Signed in as: ${result.user?.email}");
      }

      // Only navigate if mounted
      if (context.mounted) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => MyAppView()));
      }
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuth error: ${e.code} - ${e.message}");
      if (e.code == 'credential-already-in-use') {
        // Optional: handle if user has already signed in previously
        await FirebaseAuth.instance.signInWithCredential(e.credential!);
        if (context.mounted) {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (_) => MyAppView()));
        }
      }
    } catch (e) {
      print('Google Sign-in Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () => _signInWithEmail(context),
              child: const Text('Sign in with Email'),
            ),
            ElevatedButton(
              onPressed: () => _signInWithGoogle(context),
              child: const Text('Sign in with Google'),
            ),
            ElevatedButton(
              onPressed: () => _signUpWithEmail(context),
              child: const Text('Sign up with Email'),
            ),
          ],
        ),
      ),
    );
  }
}
