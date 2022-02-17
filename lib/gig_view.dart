import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gighub/services/global_methods.dart';
import 'package:gighub/uploaded_by.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'post_job.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:gighub/map.dart';

class Gigs extends StatefulWidget {
  @override
  _GigsState createState() => _GigsState();
}

class _GigsState extends State<Gigs> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  //CollectionReference gigs = FirebaseFirestore.instance.collection('gigs');
  CollectionReference gigs = FirebaseFirestore.instance.collection('gigs');
  ThemeData theme = ThemeData();
  @override
  Widget build(BuildContext context) {
    String doc_1 = gigs.doc().id;
    String? uid_ = FirebaseAuth.instance.currentUser?.uid;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[300]),
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
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: ListTile(
                            tileColor: Colors.teal[200],
                            minVerticalPadding: 20,
                            onLongPress: () async {
                              String doc_1 = gigs.doc().id;
                              User? user = _auth.currentUser;
                              final _uid = user!.uid;
                              // PostJob p = PostJob(uploadedBy: _uid);
                              //final uid = Provider.of(context).auth.getCurrentUID();
                              showDialog(
                                  context: context,
                                  builder: (contex) {
                                    return AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed: () async {
                                            try {
                                              if (true) {
                                                await FirebaseFirestore.instance
                                                    .collection('gigs')
                                                    .doc(doc.id)
                                                    .delete();
                                                await Fluttertoast.showToast(
                                                  msg: "Task has been deleted",
                                                  toastLength:
                                                      Toast.LENGTH_LONG,
                                                  backgroundColor: Colors.grey,
                                                  fontSize: 18,
                                                );
                                                Navigator.canPop(contex)
                                                    ? Navigator.pop(contex)
                                                    : null;
                                              } else {
                                                GlobalMethod.showErrorDialog(
                                                    error:
                                                        "You cannot perform this action",
                                                    ctx: contex);
                                              }
                                            } catch (error) {
                                              GlobalMethod.showErrorDialog(
                                                  error:
                                                      "This task can't be deleted",
                                                  ctx: context);
                                            } finally {}
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                'Delete',
                                                style: TextStyle(
                                                    color: Colors.teal[400]),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                            //   await gigs.doc(doc.id).delete();
                            // }, // _deleteDialog,
                            leading: IconButton(
                              onPressed: () {
                                Navigator.push(
                      context,
                       MaterialPageRoute(
                           builder: (context) => Map()),
                     );
                              },
                              icon: Icon(Icons.location_pin),
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
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  doc['amount'],
                                  style: TextStyle(
                                    color: Colors.teal[600],
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            trailing: TextButton(
                                onPressed: () async {
                                  final number = doc['phone'];
                                  launch('tel://$number');
                                },
                                child: Text(
                                  "call",
                                  style: TextStyle(color: Colors.teal[600]),
                                ))),
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

  // _deleteDialog() async {
  //   String doc_1 = gigs.doc().id;
  //   User? user = _auth.currentUser;
  //   final _uid = user!.uid;
  //   // PostJob p = PostJob(uploadedBy: _uid);
  //   //final uid = Provider.of(context).auth.getCurrentUID();
  //   showDialog(
  //       context: context,
  //       builder: (contex) {
  //         return AlertDialog(
  //           actions: [
  //             TextButton(
  //               onPressed: () async {
  //                 try {
  //                   if (true) {
  //                     await FirebaseFirestore.instance
  //                         .collection('gigs')
  //                         .doc(doc.id)
  //                         .delete();
  //                     await Fluttertoast.showToast(
  //                       msg: "Task has been deleted",
  //                       toastLength: Toast.LENGTH_LONG,
  //                       backgroundColor: Colors.grey,
  //                       fontSize: 18,
  //                     );
  //                     Navigator.canPop(contex) ? Navigator.pop(contex) : null;
  //                   } else {
  //                     GlobalMethod.showErrorDialog(
  //                         error: "You cannot perform this action", ctx: contex);
  //                   }
  //                 } catch (error) {
  //                   GlobalMethod.showErrorDialog(
  //                       error: "This task can't be deleted", ctx: context);
  //                 } finally {}
  //               },
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Icon(
  //                     Icons.delete,
  //                     color: Colors.red,
  //                   ),
  //                   Text(
  //                     'Delete',
  //                     style: TextStyle(color: Colors.teal[400]),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }
}
