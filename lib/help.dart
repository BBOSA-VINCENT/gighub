// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gighub/main_drawer.dart';


class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Help'),
           leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainDrawer()),
              );
            },
          )
        ),
        body: Column(children: [
          SizedBox(height: 10),
          Text(
            'WE LOVE TO HELP',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                primary: Color.fromARGB(176, 255, 255, 255),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 40, 0)),
                    Center(
                      child: Text(
                        'Call Help Line',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              onPressed: () {
                                },
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                primary: Color.fromARGB(176, 255, 255, 255),
              ),
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  Icon(
                    Icons.report_problem_outlined,
                    color: Colors.black,
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 40, 0)),
                  Center(
                    child: Text(
                      'Report a Problem',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ]),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                primary: Color.fromARGB(176, 255, 255, 255),
              ),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(children: const [
                  Icon(Icons.message_outlined, color: Colors.black),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 40, 0)),
                  Center(
                    child: Text(
                      'Send Feedback',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
