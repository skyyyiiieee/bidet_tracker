import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        backgroundColor: Colors.indigo[950],
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: <Widget>[
              //   if(!isKeyboard)
              const SizedBox(height: 100),

              //logo
              Image.asset(
                'assets/Group 1 (1).png',
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
                          'Create your Account',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ])),

              const SizedBox(height: 15),

              //username
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors
                            .white, // Change this color to the desired color,
                      ),
                      fillColor: Colors.indigo[950],
                      filled: true,
                    ),
                  )),

              const SizedBox(height: 20),

              //password
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors
                            .white, // Change this color to the desired color,
                      ),
                      fillColor: Colors.indigo[950],
                      filled: true,
                    ),
                  )),

              const SizedBox(height: 20),

                //confirmpassword
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      floatingLabelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors
                            .white, // Change this color to the desired color,
                      ),
                      fillColor: Colors.indigo[950],
                      filled: true,
                    ),
                  )),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    enableFeedback: false,
                    backgroundColor: Colors.black38,
                    minimumSize: const Size(315, 70),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
                child: Image.asset('assets/Google (2).png'),
                onTap: () {
                  Navigator.pushNamed(context, '/intropage');
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        )));
  }
}
