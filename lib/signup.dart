import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/firstscreen.dart';
import 'package:firebase_database/firebase_database.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final firestoreInstance = FirebaseFirestore.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  String _email = "", _name = "", _password = "", _mobile = "";
  int _age = 0, _gender = 0;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    Firebase.initializeApp();
    return Scaffold(
        body: Center(
      child: Container(
        height: h - 100,
        width: w - 40,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              onChanged: (textname) {
                _name = textname;
              },
              decoration: decoration("NAME"),
            ),
            TextField(
              decoration: decoration("EMAIL ADDRESS"),
              onChanged: (textemail) {
                _email = textemail;
              },
            ),
            TextField(
              decoration: decoration("PASSWORD"),
              onChanged: (textpass) {
                _password = textpass;
              },
            ),
            TextField(
              decoration: decoration("GENDER"),
              onChanged: (textgender) {
                _gender = int.parse(textgender);
              },
            ),
            TextField(
              decoration: decoration("AGE"),
              onChanged: (textage) {
                _age = int.parse(textage);
              },
            ),
            TextField(
              decoration: decoration("MOBILE NUMBER"),
              onChanged: (textmob) {
                _mobile = textmob;
              },
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "SIGNUP",
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
              ),
              height: 40,
              minWidth: 250,
              color: Colors.green,
              onPressed: () {
                var firebaseUser = FirebaseAuth.instance.currentUser;
                func() async {
                  await firebaseAuth
                      .createUserWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((value) {
                    if (value.user != null) {
                      firestoreInstance
                          .collection("users")
                          .doc(value.user?.uid)
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
                    }
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
                }

                func();
              },
            )
          ],
        ),
      ),
    ));
  }
}

decoration(param) {
  return InputDecoration(
      labelText: '$param',
      labelStyle: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)));
}
