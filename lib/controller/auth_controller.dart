import 'dart:developer';

import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/widgets/show_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  AuthService authService = AuthService();
  bool isLoading = false;

  Future<bool> register() async {
    try {
      isLoading = true;
      update();
      User? user = await authService.registerSignWithEmailAndPassword(
          fullNameController.text,
          emailController.text.trim(),
          passwordController.text);
      if (user != null) {
        //? saving the shared preference data
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(emailController.text);
        await HelperFunction.saveUserNameSF(fullNameController.text);
        Get.toNamed(
          RoutesNames.homeScreen,
        );
        return true;
      } else {
        showSnackBar(Colors.red, "", "Error");
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }

  Future<bool> login() async {
    try {
      isLoading = true;
      update();
      User? user = await authService.logInWithEmailAndPassword(
          emailController.text.trim(), passwordController.text);

      if (user != null) {
        // TODO: These functions are returning boolean values , Use them to confirm data has been stored successfully.
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(user.email!);
        Get.toNamed(RoutesNames.homeScreen);
        return true;
      } else {
        showSnackBar(
          Colors.deepPurple,
          "Please login to access the features of the application",
          "Login needed !",
        );
        return false;
      }
    } catch (e) {
      log(e.toString());
      showSnackBar(Colors.red, e.toString(), "Login failed");
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }
}
