import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gighub/loginscreen.dart';
import 'package:gighub/signup.dart';
import 'package:gighub/mainAppPage.dart';

void main() {
  runApp(const GigHub());
}

class GigHub extends StatelessWidget {
  const GigHub({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GigHub',
      home: MainPage(),
    );
  }
}
