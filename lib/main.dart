import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/pages/intro_page.dart';
import 'package:flutter_application_1/pages/sign_up.dart';
import 'package:flutter_application_1/pages/map_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const IntroPage(),
      routes: {
        '/intropage' : (context) =>  const IntroPage(),
        '/loginpage' : (context) =>  const LoginPage(),
        '/sign_up' : (context) =>  const SignUpPage(),
        '/mappage' : (context) =>  const MapPage(),
      }

      
    );
  }
}
