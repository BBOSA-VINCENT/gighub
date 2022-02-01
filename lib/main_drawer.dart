import 'package:flutter/material.dart';
import 'package:gighub/main_drawer.dart';

class MainDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
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
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.work, color: Colors.teal[400]),
            title: Text(
              'Gigs',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.teal[400]),
            title: Text(
              'Payment methods',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.teal[400]),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.teal[400]),
            title: Text(
              'About',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
