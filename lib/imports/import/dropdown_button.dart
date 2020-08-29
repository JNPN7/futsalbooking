import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  DropDown({Key key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  //String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
    //  value: dropdownValue,
      icon: Icon(Icons.more_vert),
      iconSize: 24,
      onChanged: (String newValue) {
        setState(() {
          //dropdownValue = newValue;
        });
      },
      items: <String>['Edit','Cancel']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
