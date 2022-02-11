import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gighub/auth_service.dart';
import 'package:gighub/forgot_password_page.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:gighub/otp.dart';
import 'package:gighub/signup.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

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
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextFormField(
                controller: passwordController,
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
                authService.signInWithEmailAndPassword(
                    emailController.text, passwordController.text);
                // Navigator.canPop(context) ? Navigator.pop(context) : null;
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
