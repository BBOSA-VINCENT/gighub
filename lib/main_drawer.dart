//REQUIRED
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gighub/auth_service.dart';
import 'package:gighub/main_drawer.dart';
import 'package:gighub/profile_user.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatefulWidget {
  final String userImage;

  const MainDrawer({required this.userImage});
  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // void _logout(context) {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           backgroundColor: Colors.teal[400],
  //           title: Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Icon(
  //                   Icons.logout,
  //                   color: Colors.teal[400],
  //                   size: 36,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: const Text(
  //                   'Sign out',
  //                   style: TextStyle(color: Colors.teal, fontSize: 28),
  //                 ),
  //               )
  //             ],
  //           ),
  //           content: Text(
  //             'Do you want to log out from app?',
  //             style: TextStyle(
  //               color: Colors.teal[400],
  //               fontSize: 20,
  //             ),
  //           ),
  //           actions: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.canPop(context) ? Navigator.pop(context) : null;
  //                 },
  //                 child: Text('No',
  //                     style: TextStyle(color: Colors.teal[400], fontSize: 18))),
  //             TextButton(
  //                 onPressed: () {
  //                   _auth.signOut();
  //                   Navigator.canPop(context) ? Navigator.pop(context) : null;
  //                   Navigator.pushReplacement(context,
  //                       MaterialPageRoute(builder: (context) => UserState()));
  //                 },
  //                 child: Text('Yes',
  //                     style: TextStyle(color: Colors.teal[400], fontSize: 18)))
  //           ],
  //         );
  //      });
  //}
static const IconData verified= IconData(0xe699,fontFamily: 'MaterialIcons');
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
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
                  Text(
                    'BBOSA VINCENT',
                    style: TextStyle(fontSize: 22),
                  ),
                  IconButton(
                    onPressed: (){}, 
                    icon: new Icon(Icons.verified),
                    color: Colors.black,
                    highlightColor: Colors.white,),
                  Text(
                    '+256701429555',
                  ),
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
                // final FirebaseAuth _auth = FirebaseAuth.instance;
                // final User? user = _auth.currentUser;
                // final String uid = user!.uid;
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
              onPressed: () {},
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
  }
}
