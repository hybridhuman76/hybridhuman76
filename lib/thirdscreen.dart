import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

String name = "lol";
String userid = "demoid";
String mob = "9898989898";
String email = "email@email.com";
double balance = 0.0;

class _ThirdState extends State<Third> {
  final firestoreInstance = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  Future<void> getdata() async {
    DocumentSnapshot variable =
        await firestoreInstance.collection('users').doc(firebaseUser.uid).get();
    print(variable);
    print("hello");
  }

  var useremail;
  Future<void> getPhoto(id) async {
    //query the user photo
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .snapshots()
        .listen((event) {
      setState(() {
        useremail = event.get('name');
        print(useremail);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    User lol = FirebaseAuth.instance.currentUser;
    final id = lol.uid;
    // getdata();
    getPhoto(id);
    return SafeArea(
        child: Container(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text("$name",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Mobile Number: $mob",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                          Text("User ID: $userid",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                          Text("Email: $email",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Container(
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green,
                  Colors.green,
                ],
              ),
            ),
            height: 70,
            // color: Colors.pink,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Your Balance",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text("₹ $balance",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "LOGOUT",
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
              ),
              height: 40,
              minWidth: 250,
              color: Colors.green,
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((res) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (Route<dynamic> route) => false);
                });
              }),
        ],
      ),
    )));
  }
}
