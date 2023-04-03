import 'package:chat_app/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xffee7b64),
      // leading: Icon(
      //   Icons.menu,
      //   color: Colors.white,
      // ),
      toolbarHeight: 80.h,
      title: Text(
        "Groups",
        style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(
              RoutesNames.searchScreen,
            );
          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
