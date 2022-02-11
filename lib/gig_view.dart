import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gighub/services/global_methods.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'post_job.dart';

class Gigs extends StatefulWidget {
  @override
  _GigsState createState() => _GigsState();
}

class _GigsState extends State<Gigs> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference gigs = FirebaseFirestore.instance.collection('gigs');
    String docId = gigs.doc().id;
    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[200]),
      ),
      home: Scaffold(
        body: Container(
          child: StreamBuilder(
            stream: gigs.snapshots(),
            builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var doc = snapshot.data!.docs[index];
                      return ListTile(
                        minVerticalPadding: 20,
                        onLongPress: () {}, // _deleteDialog(docId),
                        leading: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                          color: Colors.teal[400],
                        ),
                        title: Text(
                          doc['name'],
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              doc['description'],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              doc['amount'],
                              style: TextStyle(
                                color: Colors.teal[400],
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        trailing: Text(
                          'Visit Profile',
                          style: TextStyle(
                            color: Colors.teal[400],
                          ),
                        ),
                      );
                    });
              } else {
                return Text('');
              }
            },
          ),
          padding: EdgeInsets.all(10),
        ),
      ),
    );
  }

  _deleteDialog(String id) async {
    User? user = _auth.currentUser;
    final _uid = user!.uid;
    //PostJob p = PostJob(uploadedBy: _uid);

    // final uid = Provider.of(context).auth.getCurrentUID();
    showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () async {
                  try {
                    if (id == _uid) {
                      await FirebaseFirestore.instance
                          .collection('gigs')
                          .doc(_uid)
                          .delete();
                      await Fluttertoast.showToast(
                        msg: "Task has been deleted",
                        toastLength: Toast.LENGTH_LONG,
                        backgroundColor: Colors.grey,
                        fontSize: 18,
                      );
                      Navigator.canPop(contex) ? Navigator.pop(contex) : null;
                    } else {
                      GlobalMethod.showErrorDialog(
                          error: "You cannot perform this action", ctx: contex);
                    }
                  } catch (error) {
                    GlobalMethod.showErrorDialog(
                        error: "This task can't be deleted", ctx: context);
                  } finally {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.teal[400]),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
