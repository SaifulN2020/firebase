import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/app_dart.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options:DefaultFirebaseOptions.currentPlatform
      //   FirebaseOptions(
  //       apiKey: "AIzaSyD5TqpsPDkSoVCjBFsM1CahdszZMkI4uWI",
  //       appId: "1:586330510232:android:f0ca3bd7584abc672211ed",
  //       messagingSenderId: "586330510232",
  //       projectId: "shopping-list-c6d4a"),
  //
      );
  runApp(const LearnFirebase());
}
