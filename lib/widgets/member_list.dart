import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/groups_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MemberList extends StatelessWidget {
  const MemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      builder: (controller) {
        return StreamBuilder(
          stream: controller.members,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              //! is not equal to zero and length not equal to same ?
              if (snapshot.data['members'] != null) {
                if (snapshot.data['members'].length != 0) {
                  return ListView.builder(
                    itemCount: snapshot.data['members'].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 10.h),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.deepPurple,
                            child: Text(
                              controller
                                  .getName(snapshot.data['members'][index])
                                  .substring(0, 1)
                                  .toUpperCase(),
                              style: MyTextStyle.headingTextStyle
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ),
                          title: Text(
                            controller.getName(snapshot.data['members'][index]),
                          ),
                          subtitle: Text(
                            controller.getId(snapshot.data['members'][index]),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      "NO MEMBERS",
                    ),
                  );
                }
              } else {
                return Center(
                  child: Text(
                    "NO MEMBERS",
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ),
              );
            }
          },
        );
      },
    );
  }
}
