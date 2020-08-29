// for storing futsal details only

import 'package:futsal/modals/futsal.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FutsalInfo {

  final CollectionReference futsalsCollection =
      Firestore.instance.collection('FutsalsInfo');

  Future<void> addUpdateFutsalInfo(
      String futsalId, String name, double latt, double long, String phone, int openingTime, int closingTime) async {
    try {
      return await futsalsCollection.document(futsalId).setData({
        'futsalId': futsalId,
        'name': name,
        'phone': phone,
        'latt': latt,
        'long': long,
        'o_time': openingTime,
        'c_time': closingTime,
        //any more fields to add ...
      });
    } catch (e) {
      print(e);
      return null;
    }
  }


//for multiple futsals
  List<FutsalData> _futsalsDataFromSnapshot(QuerySnapshot snapshot) {
     return snapshot.documents.map((doc){
      return FutsalData(
        futsalId: doc.data['futsalId'],
        phone: doc.data['phone'],
        name: doc.data['name'],
        latt: doc.data['latt'],
        long: doc.data['long'],
        openingTime: doc.data['o_time'],
        closingTime: doc.data['c_time'],
      );
    }).toList();
  }


  FutsalData _futsalDataFromSnapshot(DocumentSnapshot snapshot) {
    return FutsalData(
      futsalId: snapshot.data['futsalId'],
      phone: snapshot.data['phone'],
      name: snapshot.data['name'],
      latt: snapshot.data['latt'],
      long: snapshot.data['long'],
      openingTime: snapshot.data['o_time'],
      closingTime: snapshot.data['c_time'],
    );
  }

//get data of all futsals
  Stream<List<FutsalData>> get futsalsData {
    return futsalsCollection.snapshots().map(_futsalsDataFromSnapshot);
  }

//get data of single futsal
  Stream<FutsalData> getfutsalData(String futsalId) {
    return futsalsCollection
        .document(futsalId)
        .snapshots()
        .map(_futsalDataFromSnapshot);
  }
}
