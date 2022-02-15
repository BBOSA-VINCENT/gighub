import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gighub/auth_service.dart';
import 'package:gighub/forgot_password_page.dart';
import 'package:gighub/forgot_password_verification.dart';
import 'package:gighub/loginscreen.dart';
import 'package:gighub/payments.dart';
import 'package:gighub/post_job.dart';
import 'package:gighub/signup.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:gighub/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gighub/wrapper.dart';
import 'package:provider/provider.dart';

//import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GigHub());
}

class GigHub extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GigHub',
        home: SplashScreen(),
      ),
    );
  }
}
  
  //   return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       title: 'GigHub',
  //       home: SplashScreen());
  // }}
