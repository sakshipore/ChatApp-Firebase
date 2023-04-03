import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final String groupId;
  final String groupName;
  final String userName;
  ChatScreen({
    super.key,
    required this.groupId,
    required this.groupName,
    required this.userName,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  GroupsController groupsController = Get.find<GroupsController>();

  @override
  void initState() {
    getChatAndGroupAdmin();
    super.initState();
  }

  getChatAndGroupAdmin() async {
    await groupsController.getGroupAdmin(widget.groupId);
    await groupsController.getChats(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(widget.groupName),
        backgroundColor: Color(0xffee7b64),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                RoutesNames.groupInfoScreen,
                arguments: {
                  "groupId": widget.groupId,
                  "groupName": widget.groupName,
                  "adminName": groupsController.groupAdmin,
                },
              );
            },
            icon: Icon(
              Icons.info,
            ),
          ),
        ],
      ),
    );
  }
}
