import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(itemBuilder: (context, index) {
          return Card(
              //child: Padding(padding:),
              );
        }),
      ),
    );
  }
}
