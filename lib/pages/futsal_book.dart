import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futsal/modals/futsals.dart';

class FutsalBookPage extends StatelessWidget {
  final Futsal futsalData;
  FutsalBookPage({this.futsalData});
  @override
  Widget build(BuildContext context) {
    List<Widget> today = [
      statusBox(context, false, '7-8', futsalData),
      statusBox(context, true, '8-10', futsalData),
      statusBox(context, false, '11-1', futsalData),
      statusBox(context, true, '1-2', futsalData),
      statusBox(context, false, '2-4', futsalData),
      statusBox(context, false, '4-5', futsalData),
      statusBox(context, true, '5-7', futsalData),
      statusBox(context, false, '7-8', futsalData)];

    List<Widget> tommorow = [
      statusBox(context, false, '7-8', futsalData),
      statusBox(context, true, '8-10', futsalData),
      statusBox(context, true, '11-1', futsalData),
      statusBox(context, false, '1-2', futsalData),
      statusBox(context, false, '2-4', futsalData),
      statusBox(context, false, '4-5', futsalData),
      statusBox(context, true, '5-7', futsalData),
      statusBox(context, false, '7-8', futsalData)
    ];

    return Scaffold(
      appBar: AppBar( //appbar tysai halya ho popup halne vaye nikalda hunxa hola
        title: Text('Bookings'),
        backgroundColor: Colors.green.shade400,
      ),
      body:Container(
        padding: EdgeInsets.fromLTRB(10.0, 5.0 , 10.0, 0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15.0,),
            openingRow('April 2nd Week'),
            SizedBox(height: 25.0,),
            availableStatus('Sunday',today),
            availableStatus('Monday',tommorow),
            availableStatus('Tuesday',today)
          ],
        ),
      ),
    );
  }
}

Widget openingRow(String date){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text('Openings',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
      Text(date,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
    ],
  );
}

Widget availableStatus(String day, List<Widget> timeList){
  return Column(
    children: <Widget>[
      Text(
        day,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10.0,),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
//          children: <Widget>[
//          Status_Box(true,'7-8'),
//          Status_Box(false,'8-10'),
//          Status_Box(false,'11-1'),
//          Status_Box(true,'1-2'),
//          Status_Box(false,'2-4'),
//          Status_Box(false,'4-5'),
//          Status_Box(true, '5-7'),
//          Status_Box(false, '7-8')
//          ],
        children: timeList,
        ),
      ),
      SizedBox(height: 10.0,),
    ],
  );
}

Widget statusBox(BuildContext context, bool isBooked, String bookingTime, Futsal futsalData){
  Color statusColor = isBooked ? Colors.red : Colors.green[300] ;
  Future<Widget> _popUpBooking(){
  return isBooked ? showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Book Instantly'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(futsalData.name),
            Text('Sorry!!!!!!!'),
            Text('Already booked')
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Okay, got it!'),
          ),
        ],
      );
     }
    )
    : showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Book Instantly'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(futsalData.name),
            Text('Date and time for booking:'),
            Text('April 3'),
            Text(bookingTime)
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.green,
            child: const Text('Book'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Colors.red,
            child: const Text('Cancel'),
          ),
        ],
      );
     }
    );
  }
  return InkWell(
    onTap: () => _popUpBooking(),
    child: Stack(
      children:<Widget>[
        Container(
        margin: EdgeInsets.all(10.0),
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: statusColor,
        ),
          child: Align(
              child: Text(bookingTime),
              alignment: Alignment.center,
          ),
        ),
      ]
    ),
  );
}