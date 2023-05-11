import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/widgets/group_tile_home_screen.dart';
import 'package:chat_app/widgets/no_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupList extends StatelessWidget {
  Stream? groups;
  GroupList({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsController>(
      builder: (controller) {
        return StreamBuilder(
          stream: groups,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['groups'] != null) {
                if (snapshot.data['groups'].length != 0) {
                  return ListView.builder(
                    itemCount: snapshot.data['groups'].length,
                    itemBuilder: (context, index) {
                      int reverseIndex =
                          snapshot.data['groups'].length - index - 1;
                      return GroupTileHomeScreen(
                        groupId: controller.getId(snapshot.data['groups'][reverseIndex]),
                        groupName: controller.getName(snapshot.data['groups'][reverseIndex]),
                        userName: snapshot.data['fullName'],
                      );
                    },
                  );
                } else {
                  return NoGroup();
                }
              } else {
                return NoGroup();
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
