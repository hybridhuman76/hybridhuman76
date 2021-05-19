import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                hintText: "search gyms",
                hintStyle: TextStyle(fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
          ),
        ),
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                gymview(),
              ],
            ),
          ),
        )
      ],
    )));
  }
}

gymview() {
  return Card(
    elevation: 10,
    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Container(
            child: Image.network(
                "https://images.newindianexpress.com/uploads/user/imagelibrary/2020/9/27/w900X450/gym-EPS.jpg"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.fitness_center),
                    Text("NAME OF GYM",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Text("location",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.directions,
                        color: Colors.blue,
                      ),
                      Text("Directions",
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                // RatingBar(
                //   initialRating: 5,
                // ),
              ],
            )
          ],
        )
      ],
    ),
  );
}
