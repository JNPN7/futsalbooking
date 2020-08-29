import 'dart:async';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:futsal/modals/futsals.dart';
import 'package:futsal/pages/fusal_profile.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  Completer<GoogleMapController> _controller = Completer();

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Book Futsal'),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      // drawer: Drawer(
      //   child: Column(
      //     children: <Widget>[
      //       UserAccountsDrawerHeader(
      //         accountName: Text(
      //           'John Doe',
      //           style: TextStyle(fontSize: 22.0),
      //         ),
      //         accountEmail: Text('9861XXXXXX'),
      //         currentAccountPicture: CircleAvatar(
      //           child: Text(
      //             'J',
      //             style: TextStyle(color: Colors.black, fontSize: 40),
      //           ),
      //           backgroundColor: Theme.of(context).accentColor,
      //         ),
      //         onDetailsPressed: () {},
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.account_circle,
      //           size: 30.0,
      //           color: Colors.black,
      //         ),
      //         title: Text(
      //           'Profile',
      //           style: TextStyle(fontSize: 20.0),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.people,
      //           size: 30.0,
      //           color: Colors.black,
      //         ),
      //         title: Text(
      //           'Team',
      //           style: TextStyle(fontSize: 20.0),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.book,
      //           size: 30.0,
      //           color: Colors.black,
      //         ),
      //         title: Text(
      //           'Bookings',
      //           style: TextStyle(fontSize: 20.0),
      //         ),
      //       ),
      //       ListTile(
      //         leading: Icon(
      //           Icons.settings,
      //           size: 30.0,
      //           color: Colors.black,
      //         ),
      //         title: Text(
      //           'Settings',
      //           style: TextStyle(fontSize: 20.0),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: Stack(
        children: <Widget>[
          _googlemap(context),
          // _test()
          // _sideBarBtn(context),
          _searchbar(),
          // SearchBar(onSearch: null, onItemFound: null),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _googlemap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
          CameraPosition(target: LatLng(27.671000, 85.429800), zoom: 14),
        onMapCreated: _onMapCreated,
        markers: {khwopaFutsal, shooters},
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// Widget _sideBarBtn(context) {
//   return Padding(
//       padding: EdgeInsets.fromLTRB(0.0, 14.0, 8.0, 4.0),
//       child: Align(
//           alignment: Alignment.topLeft,
//           child: IconButton(
//               icon: Icon(
//                 Icons.menu,
//                 size: 50.0,
//                 color: Theme.of(context)PrimaryColor.,
//               ),
//               onPressed: () {
//                 print('object');
//               })));
// }

Widget _searchbar() {
  return Padding(
    padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
    child: Align(
      alignment: Alignment.topRight,
      child: SearchBar(
        onSearch: null,
        onItemFound: null,
        placeHolder: Text(""),
        cancellationWidget: Text("Cancel"),
        emptyWidget: Text("empty"),
        searchBarStyle:
          SearchBarStyle(borderRadius: BorderRadius.circular(10.0)),
      ),
    ),
  );
}

Widget _buildContainer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 140.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: futsals.length,
            itemBuilder: (BuildContext context, int index) {
              Futsal futsal = futsals[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FutsalProfile(futsalData: futsal,)),
                  );
                  // todo : navigate to futsal profile
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 5.0, 5.0, 5.0),
                      height: 140.0,
                      width: 250.0,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(130.0, 5.0, 5.0, 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.yellow,
                              ),
                              child: Text(
                                '\Rs. ${futsal.price}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              width: 90.0,
                              child: Text(
                                futsal.name,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            _buildRatingStars(futsal.ratings),
                            Container(
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center, // text to center
                              child: Text(
                                futsal.textLocation,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 120.0,
                          width: 110.0,
                          image: NetworkImage(futsal.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          )),
    ),
  );
}

Marker khwopaFutsal = Marker(
  markerId: MarkerId('KFCT'),
  position: LatLng(27.662268, 85.423466),
  infoWindow: InfoWindow(title: 'Khwopa'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
);

Marker shooters = Marker(
  markerId: MarkerId('SFC'),
  position: LatLng(27.666625, 85.426620),
  infoWindow: InfoWindow(title: 'Shooters'),
  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
);


Text _buildRatingStars(int rating) {
  String stars = '';
  for (int i = 0; i < rating; i++) {
    stars += '⭐';
  }
  return Text(stars);
}
//////Couldnt use need to work in it
Marker setMark(List location, String name){
  Marker mark = Marker(
    markerId: MarkerId('SFD'),
    position: LatLng(location[0], location[1]),
    infoWindow: InfoWindow(title: name),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
  );
  return mark;
}
Set<Marker> marker(){
  Set marks = {};
  for (Futsal futsal in futsals){
    marks.add(setMark(futsal.location, futsal.name));
  }
  print (marks);
  return marks;
}
///////////////////
