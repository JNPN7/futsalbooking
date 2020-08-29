import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  
  @override
  Widget build(BuildContext context) {
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
            icon: Icon( Icons.exit_to_app),
            onPressed: () { },
          ),

        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () { },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/image1.jpg'),
                      radius: 60.0,
//                child: IconButton(
//                  icon: Icon(
//                    Icons.edit,
//                  ),
//                  color: Colors.blueAccent,
//                ),
                    ),

                    Positioned(
                      bottom: 5.0,
                      right: 5.0,
                      child: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: (){},
                        color: Color.fromRGBO(0, 0, 255, 0.5),
                      ),
                    )
                  ]
              ),
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
            SizedBox(height: 5.0,), //sizedbox will create a box useful for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lucifer',
                  style: TextStyle(
                    color: Colors.green.shade400,
                    letterSpacing: 2.0,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Text(
              'KIT NO',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5.0,), //sizedbox will create a box useful for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '10',
                  style: TextStyle(
                    color: Colors.green.shade400,
                    letterSpacing: 2.0,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Text(
              'POSITION',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 5.0,), //sizedbox will create a box useful for spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'STRIKER',
                  style: TextStyle(
                    color: Colors.green.shade400,
                    letterSpacing: 2.0,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0,),
                Text(
                  '+977-98XXXXXXXX',
                  style: TextStyle(
                    color: Colors.green.shade400,
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(width: 80.0,),
                IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
