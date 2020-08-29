// for storing user images and other info not covered by authentications
//work related to image is done may contain error


import 'package:futsal/modals/imageData.dart';
import 'package:futsal/modals/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  final User user;
  UserInfo({this.user});
  final CollectionReference userCollection =
      Firestore.instance.collection('Users');

  Future<void> addUpdateUserInfo(String name,
      {int kitNo = 0, String teamName = "XYZ", String imgUrl}) async {
    try {
      return await userCollection.document(user.uid).setData({
        'uid': user.uid,
        'name': name,
        'phone': user.phone,
        'teamName': teamName,
        'kitNo': kitNo,
        'image': imgUrl,
        //any more fields to add ...
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

//for updating single field
  Future<void> updateUserInfoTeamName(String teamName) async {
    try {
      return await userCollection.document(user.uid).updateData({
        'phone': user.phone,
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: snapshot.data['uid'],
      phone: snapshot.data['phone'],
      name: snapshot.data['name'],
      teamName: snapshot.data['teamName'],
      kitNo: snapshot.data['kitNo'],
      image: ImageData(imageId: snapshot.data['uid'], url: snapshot.data['image'])
    );
  }

  Stream<UserData> get userData {
    return userCollection
        .document(user.uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
