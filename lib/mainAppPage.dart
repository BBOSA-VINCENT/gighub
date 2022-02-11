import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gighub/gig_view.dart';
import 'package:gighub/main_drawer.dart';
import 'package:gighub/post_job.dart';
import 'package:gighub/view_job.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    User? uid = FirebaseAuth.instance.currentUser;
    String id = uid!.uid;
    ThemeData theme = ThemeData();
    theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[400]),
    );
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
          drawer: MainDrawer(
            userImage: '',
          ),
          body: TabBarView(
            children: [
              Gigs(),
              PostJob(uploadedBy: id),
            ],
          ),
        ));
  }
}
