import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[600]),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Text(
              'Welcome to',
              style: TextStyle(
                fontFamily: 'MochiyPopOne',
                fontSize: 25,
              ),
            ),
            Image.asset('gighub.png'),
            CircleAvatar(
              backgroundImage: AssetImage('assets/people.jpg'),
              radius: 70.0,
            ),
            Divider(
              height: 20.0,
              color: Colors.teal[600],
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.number,
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
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('LOGIN'),
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(60.0),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(onPressed: () {}, child: Text('Forgot Password')),
            Text("Dont have an account?"),
            TextButton(onPressed: () {}, child: Text('Sign up')),
          ],
        ),
      ),
    );
  }
}
