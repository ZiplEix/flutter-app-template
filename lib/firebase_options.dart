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
    apiKey: 'AIzaSyA8LDCBK8dhfC-5q6Kt2vGYsmmWwq7eSnI',
    appId: '1:206526087597:web:2ff28bbb1d36bccc156124',
    messagingSenderId: '206526087597',
    projectId: 'flutter-app-template-91af9',
    authDomain: 'flutter-app-template-91af9.firebaseapp.com',
    storageBucket: 'flutter-app-template-91af9.appspot.com',
    measurementId: 'G-DFSLX9Z7GR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6pKpx18LRmfwVzbtaSH5GLeMRYkYK2jE',
    appId: '1:206526087597:android:4a5b57e20a008f54156124',
    messagingSenderId: '206526087597',
    projectId: 'flutter-app-template-91af9',
    storageBucket: 'flutter-app-template-91af9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBA-f5fwyqP6w688vOGf_6H7ok7BYr9u-k',
    appId: '1:206526087597:ios:1bd9057539dd169e156124',
    messagingSenderId: '206526087597',
    projectId: 'flutter-app-template-91af9',
    storageBucket: 'flutter-app-template-91af9.appspot.com',
    iosClientId: '206526087597-qslge5ivdqmad5bg6i5q2138m7a1nldq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppTemplate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBA-f5fwyqP6w688vOGf_6H7ok7BYr9u-k',
    appId: '1:206526087597:ios:1bd9057539dd169e156124',
    messagingSenderId: '206526087597',
    projectId: 'flutter-app-template-91af9',
    storageBucket: 'flutter-app-template-91af9.appspot.com',
    iosClientId: '206526087597-qslge5ivdqmad5bg6i5q2138m7a1nldq.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterAppTemplate',
  );
}