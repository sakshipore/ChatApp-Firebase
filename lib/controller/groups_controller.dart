import 'dart:developer';

import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:chat_app/widgets/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupsController extends GetxController {
  DatabaseService service =
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid);
  TextEditingController groupsController = TextEditingController();
  bool isJoined = false;
  User? user;
  bool isLoading = true;
  Stream? groups;
  // Stream<QuerySnapshot>? chats;
  String? groupAdmin;
  Stream? members;

  Future<void> getUserGroups() async {
    groups = await service.getUserGroups();
    // return groups;
    isLoading = false;
    update();
  }

  // String manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getName(String res) {
    return res.split("_").last;
    // return res.substring(0, res.indexOf("_") + 1);
  }

  Future<void> setGroupName(
      String userName, String userId, String groupName) async {
    try {
      isLoading = true;
      update();
      await service.createGroup(userName, userId, groupName);
      Get.back();
      showSnackBar(Colors.green, "Group created successfully !", "Done !");
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<void> toggleGroupJoin(
      String userName, String groupId, String groupName) async {
    isJoined = await DatabaseService(uid: user!.uid)
        .toggleGroupJoin(groupId, userName, groupName);

    if (isJoined) {
      isJoined = !isJoined;
      update();
      showSnackBar(Colors.green, "Successfully joined the group", "Done !");
      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed(
          RoutesNames.chatScreen,
          arguments: {
            "groupId": groupId,
            "groupName": groupName,
            "userName": userName,
          },
        );
      });
    } else {
      isJoined = !isJoined;
      update();
      showSnackBar(Colors.red, "Left the group $groupName", "Left !");
    }
  }

  Future<void> joinedOrNot(
      String userName, String groupId, String groupName, String admin) async {
    isJoined = await DatabaseService(uid: user!.uid)
        .isUserJoined(groupName, groupId, userName);

    update();
  }

  // Future getChats(String groupId) async {
  //   isLoading = false;
  //   update();
  //   chats = await service.getChats(groupId);
  //   isLoading = true;
  //   update();
  // }

  Future<void> getGroupAdmin(String groupId) async {
    groupAdmin = await service.getGroupAdmin(groupId);
  }

  Future<void> getGroupMembers(String groupId) async {
    members = await service.getGroupMembers(groupId);
    update();
  }

  // sendMessage(TextEditingController messageController, String userName,
  //     String groupId) async {
  //   if (messageController.text.isNotEmpty) {
  //     Map<String, dynamic> chatMessageData = {
  //       "message": messageController.text,
  //       "sender": userName,
  //       "time": DateTime.now().microsecondsSinceEpoch,
  //     };

  //     await service.sendMessage(groupId, chatMessageData);
  //     update();
  //     messageController.clear();
  //   }
  // }
}
