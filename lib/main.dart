import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gighub/forgot_password_page.dart';
import 'package:gighub/forgot_password_verification.dart';
import 'package:gighub/loginscreen.dart';
import 'package:gighub/payments.dart';
import 'package:gighub/post_job.dart';
import 'package:gighub/signup.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:gighub/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GigHub());
}

class GigHub extends StatelessWidget {
  GigHub({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GigHub',
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('Error');
            }
            if (snapshot.connectionState == ConnectionState.done) {}
            return SplashScreen();
          }),
    );
  }
}
