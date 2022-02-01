import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class PostJob extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late String gig;
  late String descrpt;
  late int amount;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[400]),
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ListView(children: [
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      gig = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Gig Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      descrpt = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      amount = value as int;
                    },
                    decoration: InputDecoration(
                        labelText: 'Amount to be paid',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    child: Text(
                      'Submit',
                    ),
                    onPressed: () async {
                      await users.add({
                        'gig': gig,
                        'descprition': descrpt,
                        'amount': amount,
                      }).then((value) => print('user added'));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(60.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ));
  }
}
