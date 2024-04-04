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
    apiKey: 'AIzaSyANogEfXONnwrFxJH8uAqnOQfWc8o-Ko6A',
    appId: '1:220567175788:web:dcb1756042b102eee40e49',
    messagingSenderId: '220567175788',
    projectId: 'learning-firebase-36981',
    authDomain: 'learning-firebase-36981.firebaseapp.com',
    storageBucket: 'learning-firebase-36981.appspot.com',
    measurementId: 'G-KEKHMQJH7J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDE2fwyCwIbl9Z3WQFyjoKKdMhGLV1qFyw',
    appId: '1:220567175788:android:795468ab4f586258e40e49',
    messagingSenderId: '220567175788',
    projectId: 'learning-firebase-36981',
    storageBucket: 'learning-firebase-36981.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcaBCZHbof_2UwZst2nLdz38W-H7lKYeQ',
    appId: '1:220567175788:ios:726cff98b7269ec2e40e49',
    messagingSenderId: '220567175788',
    projectId: 'learning-firebase-36981',
    storageBucket: 'learning-firebase-36981.appspot.com',
    iosBundleId: 'com.example.learnFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDcaBCZHbof_2UwZst2nLdz38W-H7lKYeQ',
    appId: '1:220567175788:ios:01f12920b41acbc0e40e49',
    messagingSenderId: '220567175788',
    projectId: 'learning-firebase-36981',
    storageBucket: 'learning-firebase-36981.appspot.com',
    iosBundleId: 'com.example.learnFirebase.RunnerTests',
  );
}
