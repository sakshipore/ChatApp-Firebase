import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  // TODO : Make it final and not null variable
  TextEditingController? controller;
  SearchTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Search groups...",
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
