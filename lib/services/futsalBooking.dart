import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futsal/modals/futsal.dart';
import 'package:futsal/modals/futsalBooking.dart';

class FutsalBooking {
  final FutsalData futsal;
  FutsalBooking({this.futsal});
  final CollectionReference bookingCollection =
      Firestore.instance.collection('Bookings');

  Future<void> updateBookingData(FutsalBookingData bookingData, day) async {
    //it will be better if i could use epoch time to store regular data.
    CollectionReference daysCollection =
        bookingCollection.document(futsal.futsalId).collection("days");
    await daysCollection.document(day).setData(bookingData.hourly);
  }

  List<FutsalBookingData> _futsalAllDaysBookingfromSnapshot(
      QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      FutsalBookingData(hourly: doc.data);
    }).toList();
  }

  FutsalBookingData _futsalSingleDaysBookingfromSnapshot(
      DocumentSnapshot snapshot) {
    return FutsalBookingData(hourly: snapshot.data);
  }

  //get data of all days futsalsBookings
  Stream<List<FutsalBookingData>> get futsalsData {
    return bookingCollection
        .document(futsal.futsalId)
        .collection("days")
        .snapshots()
        .map(_futsalAllDaysBookingfromSnapshot);
  }

//get data of single day futsalbooking
  Stream<FutsalBookingData> getfutsalBookingData(String futsalId) {
    return bookingCollection
        .document(futsal.futsalId)
        .collection("days")
        .document("abc")
        .snapshots()
        .map(_futsalSingleDaysBookingfromSnapshot);
  }
}
