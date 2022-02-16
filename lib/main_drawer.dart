//REQUIRED
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gighub/auth_service.dart';
import 'package:gighub/main_drawer.dart';
import 'package:gighub/profile_user.dart';
import 'package:provider/provider.dart';
import 'help.dart';

class MainDrawer extends StatefulWidget {
  final String userImage;

  const MainDrawer({required this.userImage});
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  User? user = FirebaseAuth.instance.currentUser;

  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<DocumentSnapshot>(
        stream: users.doc(user!.uid).snapshots(),
        builder: (ctx, streamSnapshot) {
          return Drawer(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: Colors.teal[400],
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          margin: EdgeInsets.only(
                            top: 30,
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/people.jpg'),
                            radius: 40.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: Row(children: [
                            Text(
                              streamSnapshot.data!['firstname'],
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(streamSnapshot.data!['lastname'],
                                style: TextStyle(fontSize: 22)),
                          ]),
                        ),
                        Text(streamSnapshot.data!['phone'],
                            style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.teal[400],
                  ),
                  title: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Text('Profile',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.payment, color: Colors.teal[400]),
                  title: TextButton(
                    onPressed: () {},
                    child: Text('Payment methods',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.help_outline, color: Colors.teal[400]),
                  title: TextButton(
                    onPressed: () {
                      //   Navigator.pushReplacement(
                      //       context, MaterialPageRoute(builder: (context) => ));
                    },
                    child: Text('Help',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.info_outline, color: Colors.teal[400]),
                  title: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Help()));
                    },
                    child: Text('About',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.logout_outlined, color: Colors.teal[400]),
                  title: TextButton(
                    onPressed: () async {
                      await authService.signOut();
                    },
                    child: Text('Logout',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
