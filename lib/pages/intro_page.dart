import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

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
                  Image.asset(
                    'assets/PO.gif',
                    width: 500,
                    height: 500,
                  ),

                  const SizedBox(height: 10),

                  // Text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                    child: Text(
                      'Login to your Google Account',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // GestureDetector for the button
                  GestureDetector(
                    child: Image.asset('assets/Google_flutter.png'),
                    onTap: () {
                      Navigator.pushNamed(context, '/mappage');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}