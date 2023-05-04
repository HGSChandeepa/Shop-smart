// import firestore package
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseConfig {
  //database collection id( here id is shoplist for each user)
  final String uid;
  DataBaseConfig({required this.uid});

  //cretae a instance of firestore
  final CollectionReference _shopList =
      FirebaseFirestore.instance.collection('shoplist');

  //the update a new user object based on firebase user
  Future updateUser(String itemName, int itemAmount) async {
    return await _shopList.doc(uid).set({
      'itemName': itemName,
      'amount': itemAmount,
    });
  }

  //add a new item to the database
  Future<void> addItem(String itemName, int itemAmount) async {
    try {
      await FirebaseFirestore.instance.collection("shoplist").add({
        'itemName': itemName,
        'amount': itemAmount,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //update a item in the database
  Future<void> updateItem(String docId, String itemName, int amount) async {
    try {
      await _shopList.doc(docId).update({
        'itemName': itemName,
        'amount': amount,
      });
    } catch (e) {
      print(e.toString());
    }
  }

  //delete item in the database
  Future<void> deleteItem(String docId) async {
    try {
      await _shopList.doc(docId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
