import 'dart:developer';

import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Map<String, dynamic> userData = {};
  // List<String?> userData = [];
  AuthService authService = AuthService();
  bool isLoading = true;

  Future<void> gettingUserData() async {
    String? name = await HelperFunction.getUserNameFromSF();
    String? email = await HelperFunction.getUserEmailFromSF();
    userData = {
      "name": name,
      "email": email,
    };
    isLoading = false;
    update();
  }

  logOut() async {
    try {
      isLoading = true;
      update();
      await authService.logOut();
      Get.toNamed(RoutesNames.loginScreen);
      return true;
    } catch (e) {
      log(e.toString());
      showSnackBar(Colors.red, e.toString(), "LogOut failed");
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }
}
