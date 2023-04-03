import 'dart:developer';

import 'package:chat_app/service/database_service.dart';
import 'package:chat_app/widgets/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupsController extends GetxController {
  DatabaseService service =
      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid);
  bool isLoading = true;
  Stream? groups;

  Future<void> getUserGroups() async {
    groups = await service.getUserGroups();
    // return groups;
    update();
  }

  // String manipulation
  String getId(String res) {
    return res.substring(0, res.indexOf("_"));
  }

  String getGroupName(String res) {
    return res.substring(0, res.indexOf("_") + 1);
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
}
