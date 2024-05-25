import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final bool obscureText;
  final String labelText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    });

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: labelText,
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
                        color: Colors.white, // Change this color to the desired color,
                      ),
                      fillColor: Colors.indigo[950],
                      filled: true,
                    ),
                  ));
  }
}
