// import firestore package
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseConfig {
  //cretae a instance of firestore
  final CollectionReference _shopList =
      FirebaseFirestore.instance.collection('shopList');
}
