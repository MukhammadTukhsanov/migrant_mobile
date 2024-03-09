// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA4D2f5708b7HOegG0aGHITvRO-kZ5lYaw',
    appId: '1:311037823370:web:1362c699c2b034ce06e073',
    messagingSenderId: '311037823370',
    projectId: 'm365-92149',
    authDomain: 'm365-92149.firebaseapp.com',
    storageBucket: 'm365-92149.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdTWvhfBSDSfCR0JPZErzPJYLsDOgjQU0',
    appId: '1:311037823370:android:8500dc83d582abd306e073',
    messagingSenderId: '311037823370',
    projectId: 'm365-92149',
    storageBucket: 'm365-92149.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1q6zjbwAq8VQG2_jecYBS8vueyvWi8Pw',
    appId: '1:311037823370:ios:e1c421e84ddfefcb06e073',
    messagingSenderId: '311037823370',
    projectId: 'm365-92149',
    storageBucket: 'm365-92149.appspot.com',
    iosBundleId: 'com.example.migrant',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1q6zjbwAq8VQG2_jecYBS8vueyvWi8Pw',
    appId: '1:311037823370:ios:58d556e0f0c8bb0806e073',
    messagingSenderId: '311037823370',
    projectId: 'm365-92149',
    storageBucket: 'm365-92149.appspot.com',
    iosBundleId: 'com.example.migrant.RunnerTests',
  );
}
