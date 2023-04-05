import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MessageController extends GetxController {
  DatabaseService service =
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid);
  bool isLoading = true;
  bool isChatLoading = true;
  Stream<dynamic>? chats;
  TextEditingController messageController = new TextEditingController();

  Future<void> getChats(String groupId) async {
    chats = await service.getChats(groupId);
    isChatLoading = false;
    update();
  }

  Future<void> sendMessage(String userName, String groupId) async {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageData = {
        "message": messageController.text,
        "sender": userName,
        "time": DateTime.now().microsecondsSinceEpoch,
      };

      await service.sendMessage(groupId, chatMessageData);
      update();
      messageController.clear();
    }
  }
}
