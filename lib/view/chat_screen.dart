import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/controller/message_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/my_text_form_field.dart';
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
  MessageController messageController = Get.put(MessageController());

  @override
  void initState() {
    getChatAndGroupAdmin();
    super.initState();
  }

  getChatAndGroupAdmin() async {
    await groupsController.getGroupAdmin(widget.groupId);
    await messageController.getChats(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
      builder: (controller) {
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
          body: Stack(
            children: <Widget>[
              ChatMessages(
                userName: widget.userName,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  color: Colors.grey,
                  child: Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          text: "Message",
                          controller: controller.messageController,
                        ),
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
                            color: Color(0xffee7b64),
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
