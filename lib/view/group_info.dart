import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/controller/search_controller.dart';
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
  SearchController searchController = Get.find<SearchController>();

  @override
  void initState() {
    groupsController.getGroupMembers(widget.groupId);
    // getChatAndGroupAdmin();
    super.initState();
  }

  // getChatAndGroupAdmin() async {
  //   await groupsController.getChats(widget.groupId);
  //   await groupsController.getGroupAdmin(widget.groupId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffee7b64),
        title: Text("Group Info"),
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
                            await searchController.toggleGroupJoin(
                              groupsController.getName(widget.adminName),
                              widget.groupId,
                              widget.groupName,
                            );
                            Get.toNamed(RoutesNames.homeScreen);
                          },
                          icon: Icon(Icons.check),
                        ),
                      ],
                    );
                  });
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
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: Color(0xffee7b64).withOpacity(0.2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Color(0xffee7b64),
                    child: Text(
                      widget.groupName.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
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
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Admin: ${widget.adminName}",
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
  }
}
