import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'movie_class.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();
  final List<Movie> movieList = [];

  @override
  void initState() {
    //_getMoviesList();
    super.initState();
  }

  void _getMoviesList() {
    _firebaseFirestore.collection("movie").get().then((value) {
      movieList.clear();
      for (QueryDocumentSnapshot doc in value.docs) {
        movieList
            .add(Movie.fromJson(doc.id, doc.data() as Map<String, dynamic>));
        print(doc.data());
      }
    });
  }
  Future<void> getImageFromFirebase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.absolute}/file-to-upload.png';
    File file = File(filePath);

    try {
      await mountainsRef.putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      // ...
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List Screen"),
      ),
      body: StreamBuilder(
        stream: _firebaseFirestore.collection("movie").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.hasError.toString()),
            );
          }
          movieList.clear();
          for (QueryDocumentSnapshot doc in (snapshot.data?.docs ?? [])) {
            movieList.add(
                Movie.fromJson(doc.id, doc.data() as Map<String, dynamic>));
            print(doc.data());
          }

          return ListView.separated(
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(movieList[index].name),
                  subtitle: Text(movieList[index].language),
                  leading: Text(movieList[index].rating),
                  trailing: Text(movieList[index].year),
                );
              },
              separatorBuilder: (_, __) {
                return Divider();
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Map<String, dynamic> newMovieList = {
            "name ": "Hahahah",
            "year": "2006",
            "language": "hindi",
            "rating ": "305",
          };
          _firebaseFirestore.collection("movie").add(newMovieList);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
 