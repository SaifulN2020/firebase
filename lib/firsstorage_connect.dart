import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  final storage = FirebaseStorage.instance;
  ImagePicker imagePick = ImagePicker();

  final List<String> imagePath = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image View"),
        ),
        body: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Write the pic name",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "details of image"),
            ),
            IconButton(
                onPressed: () {
                  //imagePick.pickImage(source: ImageSource.camera);
                  imagePick.pickImage(source: ImageSource.gallery);
                },
                icon: const Icon(Icons.camera)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.browse_gallery))
          ],
        )
        // GridView.builder(
        //
        //
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //        mainAxisSpacing: 15,crossAxisCount: 1,
        //     ),
        //     itemBuilder: (context, index ){
        //       return Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Container(
        //           color: Colors.lightBlue,
        //
        //         ),
        //       );
        //     })

        );
  }
}
