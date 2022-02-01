import 'package:flutter/material.dart';
import 'package:gighub/main_drawer.dart';
import 'package:gighub/post_job.dart';
import 'package:gighub/view_job.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[400]),
    );
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error');
          }
          if (snapshot.connectionState == ConnectionState.done) {}
          return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal[400],
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                          text: 'Available Gigs',
                          icon: Icon(
                            Icons.post_add_outlined,
                            color: Colors.black,
                          )),
                      Tab(
                        text: 'Post Gig',
                        icon: Icon(
                          Icons.view_agenda_outlined,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                drawer: MainDrawer(),
                body: TabBarView(
                  children: [
                    ViewJob(),
                    PostJob(),
                  ],
                ),
              ));
        });
  }
}
