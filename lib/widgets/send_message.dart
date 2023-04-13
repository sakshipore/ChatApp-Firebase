import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/message_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendMessage extends StatelessWidget {
  final String text;
  SendMessage({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(      
      builder: (controller) {
        return TextFormField(
          controller: controller.messageController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepPurple,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.deepPurple,
              ),
            ),
            hintText: text,
            hintStyle: MyTextStyle.normalTextStyle,
          ),
        );
      }
    );
  }
}
