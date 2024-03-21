import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<bool> ValidUser(email, collection) async {
  bool inCollection = false;
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(collection).get();
  List data = querySnapshot.docs;
  for (var item in data) {
    if (item["email"] == email) {
      inCollection = true;
      break;
    }
  }
  return inCollection;
}

Future<QueryDocumentSnapshot?> FindUser(email, collection) async {
  var user;
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection(collection).get();
  List<QueryDocumentSnapshot> data = querySnapshot.docs;
  for (var item in data) {
    if (item["email"] == email) {
      return item;
    }
  }
}
