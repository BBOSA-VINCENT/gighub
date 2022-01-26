import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[600]),
      ),
      home: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('gighub.png'),
              CircleAvatar(
                backgroundImage: AssetImage('assets/people.jpg'),
                radius: 30.0,
              ),
            ],
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter First Name',
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Last Name',
                border: OutlineInputBorder(),
                labelText: 'Last Name',
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Password',
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Location',
                border: OutlineInputBorder(),
                labelText: 'Location',
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Checkbox(
              value: true,
              onChanged: (value) {},
              activeColor: Colors.teal[600],
            ),
            Text("I accept all"),
            TextButton(onPressed: () {}, child: Text('terms and conditions')),
          ]),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('REGISTER'),
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(60.0),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
