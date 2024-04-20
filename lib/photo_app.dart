import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PhotoApp extends StatefulWidget {
  const PhotoApp({Key? key}) : super(key: key);

  @override
  State<PhotoApp> createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("photoapp").snapshots(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading"),
            );
          } else {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return GridTile(child: Image.network(data["image"]));
              },
            );
          }
        },
      ),
    );
  }
}
