import 'package:flutter/material.dart';
import 'package:flutter_application_1/test.dart';
// import 'package:google_place/google_place.dart';
import 'package:google_place/google_place.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
// import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GooglePlace? googlePlace;
  double _width = 0;
  bool expanded = false;
  TextEditingController textController = TextEditingController();

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void initState() {
    super.initState();
    String apiKey = 'hehe';
    googlePlace = GooglePlace(apiKey);
  }

  // AIzaSyCFgLzN2-SMVLJOJw3qrZXBarb1elYjU6I

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    // double lat = double.parse(position.latitude);
    // double lng = double.parse(position.longitude);
    getdata() async {
      print(await googlePlace?.search.getNearBySearch(
          Location(lat: 77.3910, lng: 28.5355), 50000,
          type: "gym"));
    }

// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=50000&type=gym&key=AIzaSyCFgLzN2-SMVLJOJw3qrZXBarb1elYjU6I
    getdata();
    return Scaffold(
      body: Container(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FullPageShimmerExample()));
                  }),
              AnimatedContainer(
                // Use the properties stored in the State class.
                // width: _width,
                width: _width,
                height: 40,

                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: _borderRadius,
                ),
                // Define how long the animation should take.
                duration: Duration(milliseconds: 1200),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "search gyms",
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      if (expanded == false) {
                        _width = w - 100;
                        expanded = true;
                      } else {
                        _width = 0;
                        expanded = false;
                      }
                    });
                  }),
            ],
          ),

          //todo: uncomment below widget to make it visible
          // Row(
          //   children: <Widget>[
          //     IconButton(icon: Icon(Icons.menu), onPressed: () {}),
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          //       child: Container(
          //           height: 40,
          //           width: w - 58,
          //           color: Colors.transparent,
          //           child: Center(
          //             child: TextField(
          //               textAlignVertical: TextAlignVertical.bottom,
          //               textAlign: TextAlign.start,
          //               decoration: InputDecoration(
          //                   suffixIcon: IconButton(
          //                     icon: Icon(Icons.search),
          //                     onPressed: () {},
          //                   ),
          //                   hintText: "search gyms",
          //                   hintStyle: TextStyle(fontWeight: FontWeight.w400),
          //                   border: OutlineInputBorder(
          //                       borderRadius:
          //                           BorderRadius.all(Radius.circular(15)))),
          //             ),
          //           )),
          //     ),
          //   ],
          // ),

          Container(
            height: h - 140,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[],
              ),
            ),
          )
        ],
      ))),
    );
  }
}

gymview(String gymName, String gymLocation, double gymDistance) {
  return Card(
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            height: 200,
            width: double.maxFinite,
            child: Image.network(
              "https://images.newindianexpress.com/uploads/user/imagelibrary/2020/9/27/w900X450/gym-EPS.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.fitness_center),
                          Container(
                            width: 180,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                "",
                                // "$gymName",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.location_on),
                          Container(
                            width: 180,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                "$gymLocation",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.directions,
                            color: Colors.green,
                          ),
                          Text(
                            'Get Directions',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        )
                      ],
                    ),
                    Text("(1 review/s)"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.map),
                        Text(
                          "$gymDistance kms",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}
