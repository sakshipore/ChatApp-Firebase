import 'package:chat_app/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupTileHomeScreen extends StatelessWidget {
  final String userName;
  final String groupId;
  final String groupName;
  GroupTileHomeScreen({
    super.key,
    required this.groupId,
    required this.groupName,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          RoutesNames.chatScreen,
          arguments: {
            "groupId": groupId,
            "groupName": groupName,
            "userName": userName,
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.deepPurple,
            child: Text(
              groupName.substring(0, 1).toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          title: Text(
            groupName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Joined conversation !",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
        ),
      ),
    );
  }
}
