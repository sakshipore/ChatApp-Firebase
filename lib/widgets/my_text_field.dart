import 'package:chat_app/controller/groups_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    GroupsController groupsController=Get.find<GroupsController>();
    return TextField(
      controller: groupsController.groupsController,
      // onChanged: (value) {
      //   groupsController.groupsController=value;
      // },
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffee7b64),
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffee7b64),
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
