import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:futsal/modals/bfc.dart';
import 'package:futsal/modals/imageData.dart';
import 'package:futsal/modals/user.dart';
import 'package:futsal/services/auth.dart';
import 'package:futsal/services/database.dart';
import 'package:futsal/services/uploadImage.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>  with AutomaticKeepAliveClientMixin{
  File _image;

  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = selected;
    });
  }

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final user = Provider.of<User>(context);
    final bfc = Provider.of<BFC>(context);
    return Scaffold(
      //backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('PROFILE'),
        centerTitle: true,
        backgroundColor: Colors.green.shade400,
        elevation: 0.0, //to remove the drop shadow
        actions: [
          // action button
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Stack(children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(bfc.imgUrl ??
                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.DQnLITKCIMuvpA6IhsdmYwHaHa%26pid%3DApi&f=1'),
                    radius: 60.0,
                  ),
                  Positioned(
                    bottom: 2.0,
                    right: 2.0,
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                      await _pickImage(ImageSource.gallery);
                      ImageData imageData =
                          await UplaodImage().uploadImage(user.uid, _image);
                      await DatabaseService(uid: user.uid)
                          .updateImage(imageData.url);
                    },
                      color: Colors.black,
                    ),
                  )
                ]),
              ),
              Divider(
                height: 70.0,
                color: Colors.grey[800],
              ),
              Text(
                'NAME',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ), //sizedbox will create a box useful for spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bfc.name,
                    style: TextStyle(
                      color: Colors.green.shade400,
                      letterSpacing: 2.0,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: ()  {                  
                    },
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'KIT NO',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ), //sizedbox will create a box useful for spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bfc.kitNo.toString(),
                    style: TextStyle(
                      color: Colors.green.shade400,
                      letterSpacing: 2.0,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'POSITION',
                style: TextStyle(
                  color: Colors.grey,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ), //sizedbox will create a box useful for spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bfc.position,
                    style: TextStyle(
                      color: Colors.green.shade400,
                      letterSpacing: 2.0,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '+977-${bfc.phone}',
                    style: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 20.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}