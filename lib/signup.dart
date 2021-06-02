import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/firstscreen.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _email, _password, _name;
  var _mobile;
  String _gender;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "name"),
              onChanged: (text1) {
                _name = text1;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "email address"),
              onChanged: (text2) {
                _email = text2;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "password"),
              onChanged: (text3) {
                _password = text3;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "gender"),
              onChanged: (text4) {
                _gender = text4;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "mobile number"),
              onChanged: (text5) {
                _mobile = text5;
              },
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                auth.createUserWithEmailAndPassword(
                  email: _email,
                  password: _password,
                );

                FirebaseFirestore.instance
                    .collection('users')
                    .add({'userdetails[0]': '$_name'});
                FirebaseFirestore.instance
                    .collection('users')
                    .add({'userdetails[1]': '$_email'});
                FirebaseFirestore.instance
                    .collection('users')
                    .add({'userdetails[2]': '$_gender'});
                FirebaseFirestore.instance
                    .collection('users')
                    .add({'userdetails[3]': '$_mobile'});
                User firebaseUser = FirebaseAuth.instance.currentUser;

                if (firebaseUser != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => First()));
                }
              },
              child: Text("SIGNUP"),
            )
          ],
        ),
      ),
    );
  }
}
