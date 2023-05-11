import 'package:chat_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  SearchTextField({super.key, required this.controller, required this.text,});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),
        hintText: text,
        hintStyle: MyTextStyle.normalTextStyle,
      ),
    );
  }
}
