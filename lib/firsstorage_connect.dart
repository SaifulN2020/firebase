import 'dart:io';

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
  String uniqueFilaName = DateTime.now().microsecondsSinceEpoch.toString();

  ImagePicker imagePick = ImagePicker();
  String? imageUrl;

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
                hintText: "Enter the item name",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Enter the item quantity"),
            ),
            IconButton(
                onPressed: () async {
                  XFile? file =
                      await imagePick.pickImage(source: ImageSource.camera);
                  //imagePick.pickImage(source: ImageSource.gallery);
                  print("${file?.path}");

                  if (file == null) return;
                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImage = referenceRoot.child("image");
                  Reference referenceImageToUpload =
                      referenceDirImage.child(uniqueFilaName);
                  try {
                    await referenceImageToUpload.putFile(File(file!.path));
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (error) {}
                },
                icon: const Icon(Icons.camera)),
            TextButton(onPressed:(){


            }, child: Text("Submit"))
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
