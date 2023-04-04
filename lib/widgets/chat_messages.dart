import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/widgets/message_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMessages extends StatelessWidget {
  String userName;
  ChatMessages({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    GroupsController groupsController = Get.find<GroupsController>();
    return StreamBuilder(
        stream: groupsController.chats,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return MessageTile(
                        message: snapshot.data.docs[index]['message'],
                        sender: snapshot.data.docs[index]['sender'],
                        sentByMe:
                            userName == snapshot.data.docs[index]['sender']);
                  },
                )
              : Container();
        });
  }
}
