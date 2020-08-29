import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:futsal/modals/imageData.dart';

class UplaodImage {
  //imgId = userId or imgId = futsalId
  Future<ImageData> uploadImage(String imgId, File image) async {
    StorageReference imageReference =
        FirebaseStorage.instance.ref().child(imgId);
    StorageUploadTask uploadTask = imageReference.putFile(image);
    StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;
    var imageUrl = await storageSnapshot.ref.getDownloadURL();
    String url = imageUrl.toString();
    return ImageData(
      url: url,
      imageId: imgId,
    );
  }
}
