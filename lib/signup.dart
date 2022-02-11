//REQUIRED
import 'dart:io';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gighub/auth_service.dart';
//import 'package:gighub/user_state.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  late String firstname;
  late String lastname;
  late String email;
  late String password;
  late String phone;
  late String location;

  bool _obscureText = true;
  static GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    ThemeData theme = ThemeData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[400]),
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _FormKey,
          child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset('gighub.png'),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/people.jpg'),
                        radius: 80.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: firstNameController,
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
                      keyboardType: TextInputType.name,
                      controller: lastnameController,
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
                      controller: phoneController,
                      keyboardType: TextInputType.text,
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
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        // suffixIcon: GestureDetector(
                        //   onTap: () {
                        //     setState(() {
                        //       _obscureText:
                        //       !_obscureText;
                        //     });
                        //   },
                        //   child: Icon(
                        //     _obscureText
                        //         ? Icons.visibility
                        //         : Icons.visibility_off,
                        //     color: Colors.teal[400],
                        //   ),
                        // ),
                        hintText: 'Enter password',
                        border: OutlineInputBorder(),
                        labelText: 'password',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: locationController,
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
                      activeColor: Colors.teal[400],
                    ),
                    Text("I accept all"),
                    TextButton(
                        onPressed: () {}, child: Text('terms and conditions')),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      _FormKey.currentState!.save();
                      await authService.createUserWithEmailAndPassword(
                          emailController.text,
                          passwordController.text,
                          firstNameController.text,
                          lastnameController.text,
                          phoneController.text,
                          locationController.text);
                      Navigator.pop(context);
                    },
                    child: Text('REGISTER'),
                    style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(60.0),
                    )),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
