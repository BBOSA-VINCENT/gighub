import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() =>
      _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState
    extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool _pinSuccess = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    double _headerHeight = 100;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[400]),
        ),
        home: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: _headerHeight,
                  ),
                  SafeArea(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Verification',
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                  // textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Enter the verification code we just sent you on your phone number.',
                                  style: TextStyle(
                                      // fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                  // textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                OTPTextField(
                                  fieldStyle: FieldStyle.box,
                                  length: 4,
                                  width: 300,
                                  fieldWidth: 50,
                                  style: TextStyle(fontSize: 30),
                                  onCompleted: (pin) {
                                    setState(() {
                                      _pinSuccess = true;
                                    });
                                  },
                                ),
                                SizedBox(height: 50.0),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "If you didn't receive a code! ",
                                        style: TextStyle(
                                          color: Colors.black38,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Resend',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal[400]),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40.0),
                                Container(
                                  child: ElevatedButton(
                                    child: Text('VERIFY'),
                                    style: ElevatedButton.styleFrom(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(60.0),
                                      ),
                                    ),
                                    onPressed: _pinSuccess
                                        ? () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainPage()),
                                                    (Route<dynamic> route) =>
                                                        false);
                                          }
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
