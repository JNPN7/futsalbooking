import 'package:flutter/material.dart';
import 'package:futsal/imports/futsal_porfile_pic_strap.dart';
import 'package:futsal/imports/futsal_profile_detail.dart';
import 'package:futsal/imports/futsal_profile_map.dart';
import 'package:futsal/modals/futsals.dart';

class FutsalProfile extends StatelessWidget {
  final Futsal futsalData;
  FutsalProfile({this.futsalData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              FutsalProfileMap(futsalName: futsalData.name, textLocation: futsalData.textLocation, location: futsalData.location),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Details(futsalData: futsalData),
                      PicStarp(),
                    ]
                  ),
                )
              ),
            ],
          ),

          Positioned(
              top: 15.0,
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)
              ),
            ),
          
        ]
      ),
    );
  }
}