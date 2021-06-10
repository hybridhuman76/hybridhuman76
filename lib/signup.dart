import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/firstscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  String _email, _name, _password, _mobile;
  int _age, _gender;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    Firebase.initializeApp();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (textname) {
                _name = textname;
              },
              decoration: InputDecoration(hintText: "name"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "email address"),
              onChanged: (textemail) {
                _email = textemail;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "password"),
              onChanged: (textpass) {
                _password = textpass;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "gender"),
              onChanged: (textgender) {
                _gender = int.parse(textgender);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "age"),
              onChanged: (textage) {
                _age = int.parse(textage);
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: "mobile number"),
              onChanged: (textmob) {
                _mobile = textmob;
              },
            ),
            MaterialButton(
              color: Colors.green,
              onPressed: () {
                var firebaseUser = FirebaseAuth.instance.currentUser;
                firebaseAuth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  firestoreInstance
                      .collection("users")
                      .doc(firebaseUser.uid)
                      .set({
                    "name": _name,
                    "age": _age,
                    "email": _email,
                    "gender": _gender,
                    "mobile": _mobile,
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => First(),
                      ));
                }).catchError((err) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text(err.message),
                          actions: [
                            TextButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                });
              },
              child: Text("SIGNUP"),
            )
          ],
        ),
      ),
    );
  }
}
