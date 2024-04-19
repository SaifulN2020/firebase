import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'add_an_item.dart';

class ShopingList extends StatefulWidget {
  const ShopingList({Key? key}) : super(key: key);

  @override
  State<ShopingList> createState() => _ShopingListState();
}

class _ShopingListState extends State<ShopingList> {
  final FirebaseFirestore _firebaseInstant=FirebaseFirestore.instance;
  final CollectionReference _referenceShopingList =
      FirebaseFirestore.instance.collection("shopinglist");
  late Stream<QuerySnapshot> _streamShopingItem;

  @override
  void initState() {
    super.initState();
    _streamShopingItem = _referenceShopingList.snapshots();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    _referenceShopingList.get();
    _referenceShopingList.snapshots();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shoping-List"),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _streamShopingItem,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.hasError.toString()),
              );
            }
            if (snapshot.connectionState == ConnectionState.active) {
              QuerySnapshot querySnapshot = snapshot.data;
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (contex){
            return AddAnItem();
          }));

        } ,child: Icon(Icons.add),
    ),
    );
  }
}
