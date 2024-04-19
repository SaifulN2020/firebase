import 'package:flutter/material.dart';
import 'package:learn_firebase/firsstorage_connect.dart';
import 'package:learn_firebase/shoping_list.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'firebase_firestorage_demo.dart';
import 'movie_list_screen.dart';

class LearnFirebase extends StatefulWidget {
  const LearnFirebase({Key? key}) : super(key: key);

  @override
  State<LearnFirebase> createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: //MovieListScreen()
        //ImagePick()
      //ShopingList()
      FirebaseFirestorageDemo()
    );
  }
}
