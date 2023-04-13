import 'package:chat_app/controller/search_controller.dart';
import 'package:chat_app/widgets/my_appbar.dart';
import 'package:chat_app/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SearchController searchController = Get.find<SearchController>();

    return GetBuilder<SearchController>(builder: (controller) {
      return Scaffold(
        appBar: MyAppBar(
          text: "Search",
          leadingIconOnTap: () {
            Get.back();
          },
          containsDrawer: false,
          leadingIcon: Icons.arrow_back,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              // color: Color(0xffee7b64),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                children: [
                  Expanded(
                    child: SearchTextField(
                      text: "Search groups",
                      controller: controller.searchController,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await controller.initiateSearchMethod();
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
