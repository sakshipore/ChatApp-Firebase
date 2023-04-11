import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupTile extends StatelessWidget {
  final String userName;
  final String groupId;
  final String groupName;
  String? admin;
  GroupTile({
    super.key,
    required this.groupId,
    required this.groupName,
    required this.userName,
    this.admin,
  });

  @override
  Widget build(BuildContext context) {
    GroupsController groupsController = Get.find<GroupsController>();

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
            "Join the conversation as $userName",
            style: TextStyle(
              fontSize: 13.sp,
            ),
          ),
          trailing: InkWell(
            onTap: () async {
              await groupsController.toggleGroupJoin(
                  userName, groupId, groupName);
            },
            child: groupsController.isJoined
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.black,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Text(
                      "Joined",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.deepPurple,
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Text(
                      "Join",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
