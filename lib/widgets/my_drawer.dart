import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              )
            : Drawer(
                child: ListView(
                  padding:
                      EdgeInsets.symmetric(vertical: 50.h, horizontal: 10.w),
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 100.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Center(
                      child: Text(
                        controller.userData['email'],
                        style: MyTextStyle.normalTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //TODO: NAME NOT DISPLAYING
                    Center(
                      child: Text(
                        controller.userData['name'],
                        style: MyTextStyle.normalTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ListTile(
                      onTap: () {},
                      leading: Icon(Icons.group),
                      //TODO: SELECTED SHOULD CHANGE
                      selectedColor: Colors.deepPurple,
                      selected: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      title: Text("Groups", style: MyTextStyle.normalTextStyle),
                    ),
                    ListTile(
                      onTap: () {
                        Get.toNamed(RoutesNames.profileScreen);
                      },
                      leading: Icon(Icons.account_circle),
                      selectedColor: Colors.deepPurple,
                      // selected: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      title:
                          Text("Profile", style: MyTextStyle.normalTextStyle),
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
                                    await controller.logOut();
                                  },
                                  icon: Icon(Icons.check),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      leading: Icon(Icons.exit_to_app),
                      selectedColor: Colors.deepPurple,
                      // selected: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                      title: Text("LogOut", style: MyTextStyle.normalTextStyle),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
