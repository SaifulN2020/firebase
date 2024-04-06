import 'package:flutter/material.dart';

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
        home: MovieListScreen()
    );
  }
}
