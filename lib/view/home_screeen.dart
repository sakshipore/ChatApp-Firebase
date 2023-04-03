import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/group_list.dart';
import 'package:chat_app/widgets/my_appbar.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:chat_app/widgets/pop_up_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProfileController profileController = Get.put(ProfileController());
  GroupsController groupsController = Get.put(GroupsController());
  // Stream? groups;
  String groupName = "";

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
        // appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: GroupList(
          groups: controller.groups,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: PASS USERNAME AND USERID AS PARAMETERS
            // popUpDialog(context, groupName, );
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
