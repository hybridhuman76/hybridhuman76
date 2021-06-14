import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Third extends StatefulWidget {
  @override
  _ThirdState createState() => _ThirdState();
}

String name = "loading..";
String userid = "demoid";
String mob = "loading..";
String email = "loading..";
double balance = 0.0;

class _ThirdState extends State<Third> {
  final firestoreInstance = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  void x() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            name = "${(value.data()?["name"])}";
            mob = "${(value.data()?["mobile"])}";
            email = "${(value.data()?["email"])}";
          });
          print('Document data: ${(value.data()?["name"])}');
        } else {
          print('Document does not exist on the database');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? lol = FirebaseAuth.instance.currentUser;
    final id = lol?.uid;
    x();
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

function(id) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return FutureBuilder<DocumentSnapshot>(
    future: users.doc(id).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        print("smth went brr");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        print("doc doestn exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        print("Full Name: ${data['name']} ${data['email']}");
      }

      return Text("loading");
    },
  );
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}
