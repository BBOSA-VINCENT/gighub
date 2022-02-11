//REQUIRED
import 'package:flutter/material.dart';

class User {
  final String uid;
  final String? email;

  User(this.uid, this.email);
}


// class AllUsersWidget extends StatefulWidget {
//   final String userId;
//   final String firstname;
//   final String lastname;
//   final String email;
//   final String phonenumber;
//   final String userImageurl;
//   const AllUsersWidget({
//     required this.userId,
//     required this.firstname,
//     required this.lastname,
//     required this.email,
//     required this.phonenumber,
//     required this.userImageurl,
//   });

//   @override
//   _AllUsersWidgetState createState() => _AllUsersWidgetState();
// }

// class _AllUsersWidgetState extends State<AllUsersWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


// class User {
//   String? uid;
//   String? firstname;
//   String? lastname;
//   String? email;
//   DateTime? createAt;
//   bool? isVerified;

//   User.fromJson(String? uid, Map<String, dynamic> data) {
//     this.uid = uid;
//     if (data.containsKey('isVerified')) {
//       isVerified = data['isVerified'];
//     }
//     if (data.containsKey('firstname')) {
//       isVerified = data['firstname'];
//     }
//     if (data.containsKey('lastname')) {
//       isVerified = data['lastname'];
//     }
//     if (data.containsKey('email')) {
//       isVerified = data['email'];
//     }
//     if (data.containsKey('createdAt')) {
//       createAt = DateTime.fromMillisecondsSinceEpoch(
//           data['createdAt'].millisecondsSinceEpoch);
//     }
//   }
// }
