import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  final Icon icon;
  final String text;
  Function(String)? onChanged;
  TextEditingController controller = new TextEditingController();
  MyTextFormField(
      {super.key,
      required this.icon,
      required this.text,
      this.onChanged,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
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
            color: Color(0xffee7b64),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffee7b64),
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