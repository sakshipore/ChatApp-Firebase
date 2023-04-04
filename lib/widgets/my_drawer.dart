import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

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
          //                           profileController.userData['email'],
          //     style: MyTextStyle.normalStyle,
          //   ),
          // ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: Text(
              profileController.userData['email'],
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
              // TODO : Why await
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
            onTap: () {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Logout",
                      ),
                      content: Text(
                        "Are you sure you want to logout ?",
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
                            await profileController.logOut();
                            // TODO : Writing this navigation line two times here as well as in logout function
                            Get.toNamed(RoutesNames.loginScreen);
                          },
                          icon: Icon(Icons.check),
                        ),
                      ],
                    );
                  });
            },
            leading: Icon(Icons.exit_to_app),
            selectedColor: Color(0xffee7b64),
            // selected: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            title: Text("LogOut", style: MyTextStyle.normalStyle),
          ),
        ],
      ),
    );
  }
}
