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
        // saving the shared preference data
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
        await HelperFunction.saveUserLoggedInStatus(true);
        await HelperFunction.saveUserEmailSF(user.email!);
        //TODO: NAME NOT BEING DISPLAYED
        // await HelperFunction.saveUserNameSF(user.);
        // isLoading = false;
        // update();
        Get.toNamed(RoutesNames.homeScreen);
        return true;
      } else {
        // isLoading = false;
        // update();
        return false;
      }
    } catch (e) {
      log(e.toString());
      showSnackBar(Colors.red, e.toString(), "Login failed");
      // isLoading = false;
      // update();
      return false;
    } finally {
      isLoading = false;
      update();
    }
  }

  // logOut() async {
  //   try {
  //     isLoading = true;
  //     update();
  //     await authService.logOut();
  //     Get.toNamed(RoutesNames.loginScreen);
  //     return true;
  //   } catch (e) {
  //     log(e.toString());
  //     showSnackBar(Colors.red, e.toString(), "LogOut failed");
  //     return false;
  //   } finally {
  //     isLoading = false;
  //     update();
  //   }
  // }
}
