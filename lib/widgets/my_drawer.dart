import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
    AuthService authService = AuthService();
    ProfileController profileController = Get.find<ProfileController>();

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
          // Center(
          //   child: Text(
          //     userName!,
          //     style: MyTextStyle.normalStyle,
          //   ),
          // ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              email!,
              style: MyTextStyle.normalStyle,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.group),
            selectedColor: Color(0xffee7b64),
            selected: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            title: Text("Groups", style: MyTextStyle.normalStyle),
          ),
          ListTile(
            onTap: () async {
              await Get.toNamed(RoutesNames.profileScreen);
            },
            leading: Icon(Icons.account_circle),
            selectedColor: Color(0xffee7b64),
            // selected: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            title: Text("Profile", style: MyTextStyle.normalStyle),
          ),
          ListTile(
            onTap: () async {
              await profileController.logOut();
              Get.toNamed(RoutesNames.loginScreen);
            },
            leading: Icon(Icons.exit_to_app),
            selectedColor: Color(0xffee7b64),
            // selected: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            title: Text("LogOut", style: MyTextStyle.normalStyle),
          ),
          //TODO: MAKE BUTTON SO THAT USER CAN LOGOUT. ON TAP SHOULD CALL FUNCTION LOGOUT AND NAVIGATE TO LOGIN SCREEN
          // MyButton(
          // onTap: () async{
          //   await

          // },
          //   height: 20.h,
          //   width: 30.w,
          //   text: "LogOut",
          // ),
        ],
      ),
    );
  }
}
