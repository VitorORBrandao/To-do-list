import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
 
  const MyTextField({
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
                  style: TextStyle(
                        color: Color.fromRGBO(130, 237, 214, 100)
                      ),
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(45, 96, 115,100),
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(130, 237, 214, 100),
                        )
                    ),
                    fillColor: Color.fromRGBO(31, 25, 47, 100),
                    filled:true,
                    hintText: hintText,
                     hintStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(139, 215, 217, 100)
                  ), 
                 ),
    )
    );
  }
}