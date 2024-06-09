import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Foreground content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  // Image
                  GestureDetector(
                    child: Image.asset('assets/Loading.gif'),
                    onTap: () {
                      Navigator.pushNamed(context, '/intropage');
                    },
                  ),
                  const SizedBox(height: 10),
                  
                ]
              )
            )
          ]
        )
      )
    );
  }
}                