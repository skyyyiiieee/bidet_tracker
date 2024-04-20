import 'dart:html';

import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.indigo[950],
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
                const SizedBox(height: 50),
            GestureDetector(
              child: Image.asset('assets/BidetLogo-unscreen.gif'),
              onTap: () {
                Navigator.pushNamed(context, '/loginpage');
              },
            ),
          ]))),
    );
  }
}
