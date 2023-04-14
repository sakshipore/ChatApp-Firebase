import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/my_appbar.dart';
import 'package:chat_app/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.find<ProfileController>();

    return Scaffold(
      appBar: MyAppBar(
        text: "Profile",
        leadingIcon: Icons.menu,
        trailingIcon: Icons.search,
        trailingIconOnTap: () {
          Get.toNamed(RoutesNames.searchScreen);
        },
      ),
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 200.sp,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Full Name",
                      style: MyTextStyle.normalTextStyle,
                    ),
                    Text(
                      profileController.userData['name'],
                      style: MyTextStyle.normalTextStyle,
                    ),
                  ],
                ),
                Divider(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                      style: MyTextStyle.normalTextStyle,
                    ),
                    Text(
                      profileController.userData['email'],
                      style: MyTextStyle.normalTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
