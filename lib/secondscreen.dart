import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  double _width = 0;
  bool expanded = false;
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Container(
        child: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: AnimatedContainer(
                // Use the properties stored in the State class.
                // width: _width,
                width: _width,
                height: 40,

                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                // Define how long the animation should take.
                duration: Duration(milliseconds: 1200),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      hintText: "search gym trainers",
                      hintStyle: TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)))),
                ),
              ),
            ),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    if (expanded == false) {
                      _width = w - 55;
                      expanded = true;
                    } else {
                      _width = 0;
                      expanded = false;
                    }
                  });
                }),
          ],
        ),
        Container(
          height: h - 140,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                trainerview(),
                trainerview(),
                trainerview(),
                trainerview(),
                trainerview(),
                trainerview(),
              ],
            ),
          ),
        )
      ],
    )));
  }
}

String speciality = "speciality", name = "name";
trainerview() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Card(
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.person,
              size: 45,
              color: Colors.green,
            ),
            title: Text(
              'Trainer Name',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              "speciality",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Icon(
              Icons.call,
              color: Colors.green,
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}
