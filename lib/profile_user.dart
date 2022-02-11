//REQUIRED
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
              return Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(streamSnapshot.data!['firstname']),
                Text(streamSnapshot.data!['lastname']),
                Text(streamSnapshot.data!['email']),
                Text(streamSnapshot.data!['phone']),
                Text(streamSnapshot.data!['location']),
              ]);
            }));
  }
}
