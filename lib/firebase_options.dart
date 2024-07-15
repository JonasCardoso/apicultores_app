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
    apiKey: 'AIzaSyByCpAPdDLv92382YFD6e6EuzBriym5PqE',
    appId: '1:678019322204:web:540339d15be55e0dff7199',
    messagingSenderId: '678019322204',
    projectId: 'bee-rasp',
    authDomain: 'bee-rasp.firebaseapp.com',
    databaseURL: 'https://bee-rasp-default-rtdb.firebaseio.com',
    storageBucket: 'bee-rasp.appspot.com',
    measurementId: 'G-KG3Z52Y8Y0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXF0sXdc7VRq_ZMnjIYYK-OtqwTEEOtVs',
    appId: '1:678019322204:android:48c556a75c7768cdff7199',
    messagingSenderId: '678019322204',
    projectId: 'bee-rasp',
    databaseURL: 'https://bee-rasp-default-rtdb.firebaseio.com',
    storageBucket: 'bee-rasp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwpGx7WV8qCDa1RYkGv0dqpskS93XU3VM',
    appId: '1:678019322204:ios:ade0b92ee9fe8ba9ff7199',
    messagingSenderId: '678019322204',
    projectId: 'bee-rasp',
    databaseURL: 'https://bee-rasp-default-rtdb.firebaseio.com',
    storageBucket: 'bee-rasp.appspot.com',
    iosBundleId: 'com.example.apicultoresApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwpGx7WV8qCDa1RYkGv0dqpskS93XU3VM',
    appId: '1:678019322204:ios:ade0b92ee9fe8ba9ff7199',
    messagingSenderId: '678019322204',
    projectId: 'bee-rasp',
    databaseURL: 'https://bee-rasp-default-rtdb.firebaseio.com',
    storageBucket: 'bee-rasp.appspot.com',
    iosBundleId: 'com.example.apicultoresApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyByCpAPdDLv92382YFD6e6EuzBriym5PqE',
    appId: '1:678019322204:web:0ff97b4ecf3298f9ff7199',
    messagingSenderId: '678019322204',
    projectId: 'bee-rasp',
    authDomain: 'bee-rasp.firebaseapp.com',
    databaseURL: 'https://bee-rasp-default-rtdb.firebaseio.com',
    storageBucket: 'bee-rasp.appspot.com',
    measurementId: 'G-Y59841Q75F',
  );

}