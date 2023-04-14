import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  TextEditingController searchController = new TextEditingController();
  bool isLoading = true;
  Object? searchSnapshot;
  bool hasUserSearched = false;
  User? user;
  String? userName;

  Future<void> initiateSearchMethod() async {
    if (searchController.text.isNotEmpty) {
      isLoading = true;
      update();
      await DatabaseService()
          .searchByName(searchController.text)
          .then((snapshot) {
        searchSnapshot = snapshot;
        isLoading = false;
        hasUserSearched = true;
        update();
      });
    }
  }

  Future getCurrentUserName() async {
    userName = await HelperFunction.getUserNameFromSF();
  }

  Future getCurrentUserId() async {
    user = FirebaseAuth.instance.currentUser;
  }
}
