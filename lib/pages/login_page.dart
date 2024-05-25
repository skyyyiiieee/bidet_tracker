import 'package:flutter/material.dart';
import 'package:flutter_button/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
   LoginPage({
    super.key,
  });
  
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.indigo[950],
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100),

              //logo
              Image.asset(
                'assets/Group_1_1.png',
                width: 300,
                height: 100,
              ),

              const SizedBox(height: 15),
              //text
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 20.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'Login to your Account',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ])),

              const SizedBox(height: 10),
              
              //username
              MyTextfield(
                controller: usernameController,
                obscureText: true,
                labelText: 'Username',
              ),

              const SizedBox(height: 20),

              //password
              MyTextfield(
                controller: passwordController,
                obscureText: true,
                labelText: 'Password',
              ),


              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    enableFeedback: false,
                    backgroundColor: Colors.black38,
                    minimumSize: const Size(310, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textStyle: const TextStyle(
                      fontSize: 20,
                    )),
                onPressed: () {
                  Navigator.pushNamed(context, '/mappage');
                },
                child: const Text("Login"),
              ),

              const SizedBox(height: 40),
              //text
              const Text(
                'or Sign in with',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

              GestureDetector(
                child: Image.asset('assets/Google_flutter.png'),
                onTap: () {
                  Navigator.pushNamed(context, '/intropage');
                },
              ),

              const SizedBox(height: 30),

              Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0),
                      ),

                      GestureDetector(
                        child: const Text("Sign Up",
                            style: TextStyle(fontSize: 15, color: Colors.grey)),
                        onTap: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                      )
                    ]),
              ),
            ],
          ),
        )));
  }
}
