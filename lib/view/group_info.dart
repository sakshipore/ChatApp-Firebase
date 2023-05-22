import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/member_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroupInfo extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String adminName;
  GroupInfo({
    super.key,
    required this.adminName,
    required this.groupId,
    required this.groupName,
  });

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  GroupsController groupsController = Get.find<GroupsController>();

  @override
  void initState() {
    groupsController.getGroupMembers(widget.groupId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Group Info",
              style: MyTextStyle.headingTextStyle,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Exit",
                        ),
                        content: Text(
                          "Are you sure you want to exit ?",
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.cancel),
                          ),
                          IconButton(
                            onPressed: () async {
                              await controller.toggleGroupJoin(
                                controller.getName(widget.adminName),
                                widget.groupId,
                                widget.groupName,
                              );
                              // TODO: Why this route ??
                              Get.toNamed(RoutesNames.homeScreen);
                            },
                            icon: Icon(Icons.check),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.deepPurple.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.deepPurple,
                        child: Text(
                          widget.groupName.substring(0, 1).toUpperCase(),
                          style: MyTextStyle.headingTextStyle,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Group: ${widget.groupName}",
                            style: MyTextStyle.normalTextStyle,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            "Admin: ${widget.adminName.split("_").last}",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MemberList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
