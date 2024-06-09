
import 'package:flutter/material.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey[800],
          body: Center(
              child: Column(children: <Widget>[
            const SizedBox(height: 50),

            //logo
            Image.asset(
              'assets/PO.gif',
              width: 500,
              height: 500,
            ),

            const SizedBox(height: 10),

            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Login to your Google Account',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ])),

            const SizedBox(height: 30),

            GestureDetector(
              child: Image.asset('assets/Google_flutter.png'),
              onTap: () {
                signInWithGoogle();
                Navigator.pushNamed(context, '/mappage');
              },
            ),
          ]))),
    );
   
  }
}
 signInWithGoogle() async {

  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken
  );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      print(userCredential.user?.displayName);
    }