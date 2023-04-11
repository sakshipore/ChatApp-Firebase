import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextStyle {
  static const String poppinsFont = "Poppins";

  static TextStyle get headingTextStyle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 25.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      );

  static TextStyle get normalTextStyle => TextStyle(
        fontFamily: poppinsFont,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
}
