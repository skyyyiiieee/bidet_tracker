import 'package:flutter/material.dart';
import 'package:flutter_button/pages/login_page.dart';
import 'package:flutter_button/pages/intro_page.dart';
import 'package:flutter_button/pages/signup.dart';
import 'package:flutter_button/pages/map_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/loginpage': (context) => LoginPage(),
          '/sign_up': (context) => SignUpPage(),
          '/mappage': (context) => const MapPage(),
        });
  }
}
