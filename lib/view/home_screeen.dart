import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/group_list.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:chat_app/widgets/pop_up_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TODO : Need to shift profileController logic to Drawer Widget.
  ProfileController profileController = Get.find<ProfileController>();
  GroupsController groupsController = Get.find<GroupsController>();
  // Stream? groups;
  // String groupName = "";

  @override
  void initState() {
    profileController.gettingUserData();
    groupsController.getUserGroups();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(builder: (controller) {
      return Scaffold(
        //TODO: ADD CUSTOMIZE APP BAR
        appBar: AppBar(
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
        ),
        drawer: MyDrawer(),
        body: GroupList(
          groups: controller.groups,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            String userId = FirebaseAuth.instance.currentUser!.uid;
            popUpDialog(
              context,
              profileController.userData['name'],
              userId,
            );
          },
          elevation: 0,
          backgroundColor: Color(0xffee7b64),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.sp,
          ),
        ),
      );
    });
  }
}
