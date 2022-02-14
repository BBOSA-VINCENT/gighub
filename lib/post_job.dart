import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class PostJob extends StatefulWidget {
  String uploadedBy;
  PostJob({required this.uploadedBy});

  @override
  State<PostJob> createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {
  // late String description;
  // late String amount;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final amountController = TextEditingController();

  // CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    String? uid_ = FirebaseAuth.instance.currentUser?.uid;
    CollectionReference gigs =
        FirebaseFirestore.instance.collection('users').doc().collection('gigs');
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
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Gig Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 40,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: amountController,
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
                      //uploadedBy = FirebaseAuth.instance.currentUser;
                      WidgetsFlutterBinding.ensureInitialized();
                      await Firebase.initializeApp();
                      gigs.add({
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'amount': amountController.text,
                      });
                      nameController.clear();
                      descriptionController.clear();
                      amountController.clear();
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
