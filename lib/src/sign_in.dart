import 'package:khutruke/src/sign_up.dart';

Future<void> signIn(String email, String password) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    print('User signed in!');
  } catch (e) {
    print('Error: $e');
  }
}
