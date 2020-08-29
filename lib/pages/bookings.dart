import 'package:flutter/material.dart';
import 'package:futsal/imports/booking_card.dart';
import 'package:futsal/modals/bookings.dart';

class Bookings extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Bookings'),
        centerTitle: true,
        //leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.green.shade400,
      ),
      body: Column(
        children: bookings.isNotEmpty ? bookings.map((data) => BookingCard(futsalData: data)).toList() :
        [
          Center(
            child: Text('No Any Bookings Yet!'),
          )
        ]
      ),
    );
  }
}