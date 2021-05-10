// demo email - abc@xyz.com
// demo pass - abc123

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstscreen.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.green),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.grey,
          accentColor: Colors.green),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hybrid Human",
        theme: theme,
        darkTheme: darkTheme,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> isSelected = [false, false];
  String error_msg = "", _email, _pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                        IconButton(
                          icon: Icon(
                            Icons.wb_sunny,
                            size: 25,
                            color: Colors.amberAccent[100],
                          ),
                          onPressed: () {
                            AdaptiveTheme.of(context).setLight();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.nightlight_round,
                            size: 25,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            AdaptiveTheme.of(context).setDark();
                          },
                        ),
                      ],
                    ),
                    Text(
                      "Hybrid",
                      style:
                          TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Human",
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ".",
                          style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              color: Colors.pink.withOpacity(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextField(
                    onChanged: (text) {
                      _email = text;
                    },
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  TextField(
                    onChanged: (text) {
                      _pass = text;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontFamily: 'Montserrat', color: Colors.white),
                      ),
                      height: 40,
                      minWidth: 250,
                      color: Colors.green,
                      onPressed: () {
                        if (_email == "abc@xyz.com" && _pass == "abc123") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => First()));
                        } else {
                          setState(() {
                            error_msg = "WRONG EMAIL OR PASSWORD, TRY AGAIN!";
                          });
                        }
                      }),
                ],
              ),
            ),
            Text("$error_msg",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 13,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

// TextField(
//                       decoration: InputDecoration(
//                           labelText: 'EMAIL',
//                           labelStyle: TextStyle(
//                             fontFamily: 'Montserrat',
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey,
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                               borderSide: BorderSide(color: Colors.green))),
//                     ),
