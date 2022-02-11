import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gighub/forgot_password_page.dart';
import 'package:gighub/loginscreen.dart';
import 'package:gighub/mainAppPage.dart';
import 'package:gighub/signup.dart';
import 'package:gighub/user_state.dart';
import 'package:gighub/wrapper.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.fadeTransition,
        duration: 4000,
        splash: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: new Image.asset('assets/gighub.png',
                width: 200.0, height: 200.0),
          ),
        ),
        nextScreen: Wrapper(),
      ),
    );
  }
}
//       home: Scaffold(
//         backgroundColor: Colors.teal[600],
//         body: Center(
//           child: Image.asset('gighub.png'),
//         ),
//       ),
//     );
//   }
// }
