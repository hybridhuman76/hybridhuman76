import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _width = 0;
  bool expanded = false;
  TextEditingController textController = TextEditingController();

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
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
                children: <Widget>[
                  gymview("CrossFitness Gym",
                      "Hoshiyarpur Village, Sector 51, Noida", 1.4),
                  gymview(
                      "GetFit Fit Forever Gym",
                      "A-72, Sector 50, near Raghuveer Nursing Home, Noida, Uttar Pradesh",
                      1.8),
                  gymview("CrossFitness Gym",
                      "Hoshiyarpur Village, Sector 51, Noida", 1.4),
                  gymview(
                      "GetFit Fit Forever Gym",
                      "A-72, Sector 50, near Raghuveer Nursing Home, Noida, Uttar Pradesh",
                      1.8),
                  gymview("CrossFitness Gym",
                      "Hoshiyarpur Village, Sector 51, Noida", 1.4),
                  gymview(
                      "GetFit Fit Forever Gym",
                      "A-72, Sector 50, near Raghuveer Nursing Home, Noida, Uttar Pradesh",
                      1.8),
                  gymview("CrossFitness Gym",
                      "Hoshiyarpur Village, Sector 51, Noida", 1.4),
                ],
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
                                "$gymName",
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
