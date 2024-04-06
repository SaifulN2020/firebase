import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Movie> movieList = [];

  @override
  void initState() {
    _getMoviesList();
    super.initState();
  }

  void _getMoviesList() {
    _firebaseFirestore.collection("movie").get().then((value) {
      movieList.clear();
      for (QueryDocumentSnapshot doc in value.docs) {
        movieList
            .add(Movie.fromjson(doc.id, doc.data() as Map<String, dynamic>));
        print(doc.data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie List Screen"),
      ),
      body: ListView.separated(
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
          return const Divider();
        },
      ),
    );
  }
}

class Movie {
  final String id, name, language, year, rating;

  Movie({
    required this.year,
    required this.id,
    required this.name,
    required this.language,
    required this.rating,
  });

  factory Movie.fromjson(String id, Map<String, dynamic> json) {
    return Movie(
        year: json["year"],
        id: id,
        name: json["name"],
        language: json["language"],
        rating: json["rating "] ?? "unknown");
  }
}
