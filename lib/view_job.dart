//REQUIRED
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gighub/job_details.dart';
import 'package:gighub/services/global_methods.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'auth_service.dart';
import 'profile_user.dart';

class ViewJob extends StatefulWidget {
  @override
  State<ViewJob> createState() => _ViewJobState();
}

class _ViewJobState extends State<ViewJob> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference gigs = FirebaseFirestore.instance.collection('gigs');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
            stream: gigs.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                children: snapshot.data!.docs.map((gigs) {
                  return Center(
                    child: GestureDetector(
                      onLongPress: () {}, //_deleteDialog(),
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => JobDetailsScreen(
                                    /* uploadedBy:User.uid,
                                      taskId: widget.taskId,*/
                                    )));
                      },
                      child: Flexible(
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            height: MediaQuery.of(context).size.height / 4,
                            decoration: BoxDecoration(
                              color: Colors.teal[400],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: new Offset(-10.0, 10.0),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new Image.asset(
                                  'assets/people.jpg',
                                  width: 100,
                                  height: 600,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(gigs['name'],
                                          overflow: TextOverflow.ellipsis),
                                      Text(
                                        gigs['description'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(gigs['amount']),
                                      // Text(users['phonenumber']),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Profile()));
                                          },
                                          child: Text(
                                            'Visit Profile',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                      IconButton(
                                          onPressed: () {}, //_mailTo,
                                          icon: Icon(
                                            Icons.mail_outline,
                                            size: 30,
                                            color: Colors.grey,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
      ),
    );
  }

  // void _mailTo() async {
  //   var mailUrl = 'mainto: ${widget.email}';
  //   print('widget.email ${widget.email}');
  //   if (await canLaunch(mailUrl)) {
  //     await launch(mailUrl);
  //   } else {
  //     print('Error');
  //     throw 'Error occured';
  //   }
  // }

  // _deleteDialog() {
  //   User? user = _auth.currentUser;
  //   final _uid = user!.uid;
  //   showDialog(
  //       context: context,
  //       builder: (ctx) {
  //         return AlertDialog(
  //           actions: [
  //             TextButton(
  //               onPressed: () async {
  //                 try {
  //                   if (widget.uploadedBy == _uid) {
  //                     await FirebaseFirestore.instance
  //                         .collection('tasks')
  //                         .doc(widget.taskId)
  //                         .delete();
  //                     await Fluttertoast.showToast(
  //                       msg: "Task has been deleted",
  //                       toastLength: Toast.LENGTH_LONG,
  //                       backgroundColor: Colors.grey,
  //                       fontSize: 18,
  //                     );
  //                     Navigator.canPop(ctx) ? Navigator.pop(ctx) : null;
  //                   } else {
  //                     GlobalMethod.showErrorDialog(
  //                         error: "You cannot perform this action", ctx: ctx);
  //                   }
  //                 } catch (error) {
  //                   GlobalMethod.showErrorDialog(
  //                       error: "This task cant be deleted", ctx: context);
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
//         body: ListView.builder(
//           itemBuilder: (context, index) {
//             return Card(
//               child: Container(
//                 child: Padding(
//                   padding:
//                       EdgeInsets.only(top: 32, bottom: 32, left: 16, right: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'UserName',
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5.0,
//                       ),
//                       Text(
//                         'Location',
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//           itemCount: 50,
//         ),
//       ),
//     );
//   }
// }

// home: ListView(

//   children: [
//     // SizedBox(
//     //   height: 10,
//     // ),
//     // searchTF(),
//     SizedBox(
//       height: 10,
//     ),
//     StreamBuilder(
//         stream: gigs.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//                  CircularProgressIndicator();
//                   );
//           }
//           return ListView(
//             children: snapshot.data!.docs.map((gigs) {
//               return Center(
//                    child:Container(
//                     width:MediaQuery.of(context).size.width/1.2,
//                      height:MediaQuery.of(context).size.height/6,
//                        child:Text(gigs['name']+gigs['description']),
//                  ),
//                 ),
//               ));
//             }).toList(),
//           );
//         }),
//           ],
//         ));
//   }
// }

// Widget searchTF() {
//   return TextField(
//     decoration: InputDecoration(
//       border: OutlineInputBorder(
//         borderRadius: const BorderRadius.all(
//           const Radius.circular(
//             5.0,
//           ),
//         ),
//       ),
//       filled: true,
//       fillColor: Colors.white60,
//       contentPadding: EdgeInsets.all(15.0),
//       hintText: 'Filter by Gig name or description',
//     ),
//   );
// }
