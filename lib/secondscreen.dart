import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
                hintText: "search gym trainers",
                hintStyle: TextStyle(fontWeight: FontWeight.w400),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)))),
          ),
        ),
        Container(
          height: 425,
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
