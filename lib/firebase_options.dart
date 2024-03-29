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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD7v-yvzZFV-leBR-vcvlPQ0-TWwoC63xw',
    appId: '1:411157703328:web:cbc342663a025ee57bb7c5',
    messagingSenderId: '411157703328',
    projectId: 'todo-app-acfc2',
    authDomain: 'todo-app-acfc2.firebaseapp.com',
    storageBucket: 'todo-app-acfc2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQP-ErakMjBQCDJK0iCdW_IirEBK4dcNc',
    appId: '1:411157703328:android:dc2d65b1c222201d7bb7c5',
    messagingSenderId: '411157703328',
    projectId: 'todo-app-acfc2',
    storageBucket: 'todo-app-acfc2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD769N-jDgv2UYPYtdBTkTxldCQjKs-xFA',
    appId: '1:411157703328:ios:d296d35184451e7a7bb7c5',
    messagingSenderId: '411157703328',
    projectId: 'todo-app-acfc2',
    storageBucket: 'todo-app-acfc2.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );
}
