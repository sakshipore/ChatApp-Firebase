import 'package:chat_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {
  final String text;
  final VoidCallback leadingIconOnTap;
  final IconData leadingIcon;
  VoidCallback? trailingIconOnTap;
  IconData? trailingIcon;
  MyAppBar({
    super.key,
    required this.text,
    required this.leadingIconOnTap,
    required this.leadingIcon,
    this.trailingIconOnTap,
    this.trailingIcon,
  });

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size(360.w, 50.h);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: 360.w,
      color: Colors.deepPurple,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: widget.leadingIconOnTap,
              child: Icon(
                widget.leadingIcon,
                color: Colors.white,
              ),
            ),
            Text(
              widget.text,
              style: MyTextStyle.headingTextStyle,
            ),
            InkWell(
              onTap: widget.trailingIconOnTap,
              child: Icon(
                widget.trailingIcon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
