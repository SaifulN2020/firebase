import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseFirestorageDemo extends StatefulWidget {
  const FirebaseFirestorageDemo({Key? key}) : super(key: key);

  @override
  State<FirebaseFirestorageDemo> createState() =>
      _FirebaseFirestorageDemoState();
}

class _FirebaseFirestorageDemoState extends State<FirebaseFirestorageDemo> {
  final FirebaseFirestore _againPractice = FirebaseFirestore.instance;
  final List<ShopItem> shopItemList = [];

  @override
  void initState() {
    _getShopingList();

    super.initState();
  }

  void _getShopingList() {
    _againPractice.collection("shopinglist").get().then((value) {
      shopItemList.clear();
      print(value);
      for (QueryDocumentSnapshot doc in value.docs) {
        shopItemList
            .add(ShopItem.fromJson(doc.id, doc.data() as Map<String, dynamic>));
        print(doc.data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firebase"),),
      body: ListView.builder(
        itemCount: shopItemList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(shopItemList[index].name),
            subtitle: Text(shopItemList[index].quantiy),
          );
        },
      ),
    );
  }
}

class ShopItem {
  late String id, name, quantiy;

  ShopItem({required this.id, required this.name, required this.quantiy});

  factory ShopItem.fromJson(String id, Map<String, dynamic> json) {
    return ShopItem(id: id, name: json["name"], quantiy: json["quantity"]);
  }
}
