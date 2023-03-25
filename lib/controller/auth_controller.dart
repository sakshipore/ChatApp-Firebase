import 'dart:developer';

import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/service/auth_service.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:chat_app/widgets/show_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController fullNameController = new TextEditingController();
  AuthService authService = AuthService();
  bool isLoading = false;

  Future<bool?> register() async {
    try {
      isLoading = true;
      update();
      await authService
          .registerSignWithEmailAndPassword(fullNameController.text,
              emailController.text.trim(), passwordController.text)
          .then((value) async {
        if (value == true) {
          // saving the shared preference data
          await HelperFunction.saveUserLoggedInStatus(true);
          await HelperFunction.saveUserEmailSF(emailController.text);
          await HelperFunction.saveUserNameSF(fullNameController.text);
          isLoading = false;
          update();
        } else {
          showSnackBar(Colors.red, "", "Error");
          return false;
        }
      });
    } catch (e) {
      log(e.toString());
      return false;
    }
    return true;
  }

//TODO: LOGIN NOT WORKING
  Future<bool?> login() async {
    try {
      isLoading = true;
      update();
      await authService
          .logInWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot=await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).gettingUserData(emailController.text);
          // saving the values to our shared preference
          await HelperFunction.saveUserLoggedInStatus(true);
          await HelperFunction.saveUserEmailSF(emailController.text);
          await HelperFunction.saveUserNameSF(snapshot.docs[0]['fullName']);
          isLoading = false;
          update();
        }
      });
    } catch (e) {
      log(e.toString());
      return false;
    }
    return true;
  }
}
