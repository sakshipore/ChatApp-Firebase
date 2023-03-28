
import 'package:chat_app/controller/profile_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/my_drawer.dart';
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

  @override
  void initState() {
    profileController.gettingUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) {
        return controller.isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Color(0xffee7b64),
            ),
          )
        : Scaffold(
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
                drawer: MyDrawer(
                  userName: controller.userData['name'],
                  email: controller.userData['email'],
                ),
              );
      }
    );
  }
}
