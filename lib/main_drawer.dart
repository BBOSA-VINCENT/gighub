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
            color: Colors.teal[600],
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('people.jpg'),
                        fit: BoxFit.fill,
                      ),
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
              color: Colors.teal[600],
            ),
            title: Text(
              'Profile',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.work, color: Colors.teal[600]),
            title: Text(
              'Gigs',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.teal[600]),
            title: Text(
              'Payment methods',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.teal[600]),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.teal[600]),
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
