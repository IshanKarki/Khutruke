// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
/// 
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDWN5vDc55v1BMbmdSW3A3_Lhqvs3lUDmY',
    appId: '1:23299183351:web:58a63bca33e4a6d6fe39f2',
    messagingSenderId: '23299183351',
    projectId: 'khutruke-piggy',
    authDomain: 'khutruke-piggy.firebaseapp.com',
    storageBucket: 'khutruke-piggy.firebasestorage.app',
    measurementId: 'G-Y4Z4QJWJDX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPIgOTDEqSChUYTpqD-MbebrhaJ4Y5JSk',
    appId: '1:23299183351:android:ee4edd56ec69709efe39f2',
    messagingSenderId: '23299183351',
    projectId: 'khutruke-piggy',
    storageBucket: 'khutruke-piggy.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5vO-WNJoojxqsf9xJv3mdFJp7IMdEU2A',
    appId: '1:23299183351:ios:4796651b84e7d305fe39f2',
    messagingSenderId: '23299183351',
    projectId: 'khutruke-piggy',
    storageBucket: 'khutruke-piggy.firebasestorage.app',
    iosBundleId: 'com.example.khutruke',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5vO-WNJoojxqsf9xJv3mdFJp7IMdEU2A',
    appId: '1:23299183351:ios:4796651b84e7d305fe39f2',
    messagingSenderId: '23299183351',
    projectId: 'khutruke-piggy',
    storageBucket: 'khutruke-piggy.firebasestorage.app',
    iosBundleId: 'com.example.khutruke',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDWN5vDc55v1BMbmdSW3A3_Lhqvs3lUDmY',
    appId: '1:23299183351:web:c91150da81e5c213fe39f2',
    messagingSenderId: '23299183351',
    projectId: 'khutruke-piggy',
    authDomain: 'khutruke-piggy.firebaseapp.com',
    storageBucket: 'khutruke-piggy.firebasestorage.app',
    measurementId: 'G-MWGYDJ2Q6Y',
  );
}
