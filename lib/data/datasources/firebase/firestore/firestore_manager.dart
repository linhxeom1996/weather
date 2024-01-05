import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class FireStoreManager {
  Future readData();
  Future addData({String? name});
  Future updateData({String? name});
}

@Singleton(as: FireStoreManager)
class FireStoreManagerImpl extends FireStoreManager {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('user');

  @override
  Future addData({String? name}) {
    return _collection.add({
      'name': name,
    });
  }

  @override
  Future readData() {
    return _collection.doc("").get();
  }

  @override
  Future updateData({String? name}) {
    return _collection.doc("").update({
      'name': name,
    });
  }
}
