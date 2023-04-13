import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/controller/message_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/my_appbar.dart';
import 'package:chat_app/widgets/send_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  MessageController messageController = Get.find<MessageController>();

  @override
  void initState() {
    getChatAndGroupAdmin();
    super.initState();
  }

  getChatAndGroupAdmin() async {
    await messageController.getChats(widget.groupId);
    await groupsController.getGroupAdmin(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
        return Scaffold(
          appBar: MyAppBar(
            text: widget.groupName,
            leadingIconOnTap: () {
              Get.back();
            },
            //! Whenever there is back button set this property as false
            containsDrawer: false,
            leadingIcon: Icons.arrow_back,
            trailingIcon: Icons.info,
            trailingIconOnTap: () {
              Get.toNamed(
                RoutesNames.groupInfoScreen,
                arguments: {
                  "groupId": widget.groupId,
                  "groupName": widget.groupName,
                  "adminName": groupsController.groupAdmin,
                },
              );
            },
          ),
          drawer: Drawer(),
          body: controller.isChatLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                )
              : Stack(
                  children: <Widget>[
                    ChatMessages(
                      userName: widget.userName,
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        color: Colors.grey,
                        child: Row(
                          children: [
                            Expanded(
                              child: SendMessage(text: "Message"),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await controller.sendMessage(
                                    widget.userName, widget.groupId);
                              },
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
