import 'package:cloud_firestore/cloud_firestore.dart';

import '../modals/bfc.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //Collection reference
  final CollectionReference bfcCollection =
      Firestore.instance.collection('BFC');

  Future updateUserData(
      [String name, String position, int ratings, int age, int kitNo, String contact, String imgUrl]) async {
    return await bfcCollection.document(uid).setData({
      'name': name,
      'position': position,
      'ratings': ratings,
      'age': age,
      'kitNo': kitNo,
      'phone': contact,
      'imgUrl': imgUrl,
    });
  }

  Future updateImage(String imgUrl) async {
    return await bfcCollection.document(uid).updateData({
     'imgUrl': imgUrl,
    });
  }

  // bfc list from snapshot
  BFC _bfcListFromSnapshot(DocumentSnapshot snapshot) {   
      return BFC(
        name: snapshot.data['name'] ?? '',
        position: snapshot.data['position'] ?? '',
        ratings: snapshot.data['rating'] ?? 0,
        age: snapshot.data['age'] ?? 0,
        kitNo: snapshot.data['kitNo'] ?? 0,
        phone: snapshot.data['phone'] ?? '98XXXXXXXX',
        imgUrl: snapshot.data['imgUrl'],
      );
   
  }

  // get bfc stream
  Stream<BFC> get bfc {
    return bfcCollection.document(uid).snapshots().map(_bfcListFromSnapshot);
  }

}