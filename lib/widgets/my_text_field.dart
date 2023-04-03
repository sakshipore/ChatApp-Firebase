import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  String groupName;
  MyTextField({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        groupName = value;
      },
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffee7b64),
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffee7b64),
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
