import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                          ),
                      labelStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                       floatingLabelStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white, // Change this color to the desired color,
                        ),

                      fillColor: Colors.indigo[950],
                      filled: true,
                    ),
                  ));
  }
}
