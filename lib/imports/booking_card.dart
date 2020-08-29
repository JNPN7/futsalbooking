import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:futsal/imports/import/dropdown_button.dart';
import 'package:futsal/modals/bookings.dart';


class BookingCard extends StatelessWidget {
  final BookingsData futsalData;
  BookingCard({this.futsalData});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Colors.green.shade200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: .7 * size.width,
                  child: Text(
                      this.futsalData.futsalName,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                    'Date: ${this.futsalData.date}'
                ),

              ],
            ),
            SizedBox(height: 3.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Time: ${this.futsalData.startingTime} - ${this.futsalData.endingTime}',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
//              IconButton(
//                icon: Icon(Icons.more_vert),
//                onPressed: (){},
//                color: Colors.black87,
//              ),
                 DropDown(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
