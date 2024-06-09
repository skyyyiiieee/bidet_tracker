import 'package:flutter/material.dart';
import 'package:flutter_button/pages/loading_page.dart';
import 'package:flutter_button/pages/intro_page.dart';
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
       home: const LoadingPage(),
        routes: {
          '/Loadingpage' : (context) => const LoadingPage(),
          '/intropage': (context) => const IntroPage(),
          '/mappage': (context) => const MapPage(),
        });
  }
}
