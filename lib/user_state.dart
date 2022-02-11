//REQUIRED FILE

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:gighub/loginscreen.dart';
// import 'package:gighub/mainAppPage.dart';

// class UserState extends StatelessWidget {
//   const UserState({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (ctx, userSnaphot) {
//           if (userSnaphot.data == null) {
//             print('user is not logged in yet');
//             return LoginScreen();
//           } else if (userSnaphot.hasData) {
//             print('user is logged in');
//             return MainPage();
//           } else if (userSnaphot.hasError) {
//             return Scaffold(
//               body: Center(
//                 child: Text('An error has been occured.Try again later'),
//               ),
//             );
//           } else if (userSnaphot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//           return Scaffold(
//             body: Center(
//               child: Text('Something went wrong'),
//             ),
//           );
//         });
//   }
// }
