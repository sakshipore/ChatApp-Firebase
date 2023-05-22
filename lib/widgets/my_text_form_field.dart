import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  final Icon? icon;
  final String text;
  Function(String)? onChanged;
  // TODO : Just create the variable controller , no need to initialize it.
  TextEditingController controller = new TextEditingController();
  MyTextFormField(
      {super.key,
      this.icon,
      required this.text,
      this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // TODO: Do not add checks on String values, Instead create boolean values i.e. isPassword.
      obscureText: text == "Password" ? true : false,
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        prefixIcon: icon,
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
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter " + text;
        }
        return null;
      },
    );
  }
}
