import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondscreen.dart';
import 'package:flutter_application_1/thirdscreen.dart';
import 'home.dart';

int _page = 0;
GlobalKey _bottomNavigationKey = GlobalKey();

class First extends StatefulWidget {
  First({Key key}) : super(key: key);
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  int selectedPage = 0;
  final _pageOptions = [Home(), Second(), Third()];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOut,
        buttonBackgroundColor: Colors.green,
        backgroundColor: Colors.transparent,
        color: Colors.green,
        height: 60,
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.sports_esports, size: 30, color: Colors.white),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
      body: _pageOptions[selectedPage],
    );
  }
}

container() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      color: Colors.grey.withOpacity(0.3),
      height: 200,
      width: double.maxFinite,
      child: Row(
        children: <Widget>[
          Text("Name"),
          Icon(Icons.arrow_upward),
        ],
      ),
    ),
  );
}
