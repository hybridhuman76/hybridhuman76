import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Center(
          child: Text("successfully logged in!!"),
        ),
        MaterialButton(
          height: 40,
          color: Colors.blue,
          onPressed: () {
            AdaptiveTheme.of(context).setDark();
          },
          child: Text(
            "dark theme",
            style: TextStyle(color: Colors.white),
          ),
        ),
        MaterialButton(
          height: 40,
          color: Colors.blue,
          onPressed: () {
            AdaptiveTheme.of(context).setLight();
          },
          child: Text(
            "light theme",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
