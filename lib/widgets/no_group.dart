import 'package:chat_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoGroup extends StatelessWidget {
  const NoGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO: GestureDetector ??
          GestureDetector(
            child: Icon(
              Icons.add_circle,
              color: Colors.grey,
              size: 75.sp,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "You've not joined any group. Tap on the add icon to create a group or also search from top search button",
            style: MyTextStyle.normalTextStyle,
          ),
        ],
      ),
    );
  }
}
