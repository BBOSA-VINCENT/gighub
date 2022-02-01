import 'package:flutter/material.dart';
import 'package:gighub/forgot_password_page.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:gighub/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[400]),
      ),
      home: Scaffold(
          body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            new Image.asset('assets/gighub.png', width: 200.0, height: 200.0),
            CircleAvatar(
              backgroundColor: Colors.teal[400],
              child:
                  Image.asset('assets/people.jpg', width: 100.0, height: 100.0),
              radius: 60.0,
            ),
            Divider(
              height: 20.0,
              color: Colors.teal[400],
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                keyboardType: TextInputType.number,
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
                obscureText: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              },
              child: Text('LOGIN'),
              style: ElevatedButton.styleFrom(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(60.0),
                ),
              ),
            ),
            SizedBox(height: 5),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()),
                  );
                },
                child: Text('Forgot Password')),
            Text("Dont have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text('Sign up')),
          ],
        ),
      )),
    );
  }
}
