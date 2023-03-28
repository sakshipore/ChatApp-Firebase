import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyDrawer extends StatelessWidget {
  String? userName;
  String? email;
  MyDrawer({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
        children: [
          Icon(
            Icons.account_circle,
            size: 100.sp,
            color: Colors.grey,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(userName!),
          Text(email!),
        ],
      ),
    );
  }
}
