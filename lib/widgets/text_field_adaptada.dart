import 'package:flutter/material.dart';

class text_field_adaptada extends StatefulWidget {
  String labelText;
  Icon? prefixIcon;
  var suffixIcon;
  bool obscureText = false;
  TextEditingController controller;

  text_field_adaptada(
      {required this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false,
      required this.controller});

  @override
  State<text_field_adaptada> createState() => _text_field_adaptadaState();
}

class _text_field_adaptadaState extends State<text_field_adaptada> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.white),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(20),
        //   borderSide: BorderSide(color: Colors.red),
        // )
      ),
    );
  }
}
