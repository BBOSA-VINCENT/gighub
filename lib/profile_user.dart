//REQUIRED
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: users.doc(user!.uid).snapshots(),
            builder: (ctx, streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal[400],
                  ),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  elevation: 0.0,
                  backgroundColor: Color(0xff555555),
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MainPage()));
                      }),
                ),
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 350,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                streamSnapshot.data!['firstname'],
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(streamSnapshot.data!['lastname'],
                                  style: TextStyle(fontSize: 20)),
                              Text(streamSnapshot.data!['email'],
                                  style: TextStyle(fontSize: 20)),
                              Text(streamSnapshot.data!['phone'],
                                  style: TextStyle(fontSize: 20)),
                              Text(streamSnapshot.data!['location'],
                                  style: TextStyle(fontSize: 20)),
                              Container(
                                height: 55,
                                width: double.infinity,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    CustomPaint(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      painter: HeaderCurvedContainer(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Profile",
                            style: TextStyle(
                              fontSize: 35,
                              letterSpacing: 1.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 5),
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/profile.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 270, left: 184),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff26A69A);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
