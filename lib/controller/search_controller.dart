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

  // TODO : Function not called any where
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

  //! maybe repeated
  // TODO : Widgets shouldn't be written in controller
  // groupList() {
  //   return hasUserSearched
  //       ? ListView.builder(
  //           shrinkWrap: true,
  //           itemCount: searchSnapshot!.docs.length,
  //           itemBuilder: (context, index) {
  //             joinedOrNot(
  //                 userName!,
  //                 searchSnapshot!.docs[index]['groupId'],
  //                 searchSnapshot!.docs[index]['groupName'],
  //                 searchSnapshot!.docs[index]['admin']);
  //             return GroupTile(
  //               groupId: searchSnapshot!.docs[index]['groupId'],
  //               groupName: searchSnapshot!.docs[index]['groupName'],
  //               userName: userName!,
  //               admin: searchSnapshot!.docs[index]['admin'],
  //             );
  //           },
  //         )
  //       : Container();
  // }

  //! ABOVE THREE METHODS ARE PART OF GROUP MODULE THEN THEY SHOULD BE IN GROUPS CONTROLLER
  //! SEARCH CONTROLLER HAS NOTHING TO DO WITH THE GROUP

  Future getCurrentUserName() async {
    userName = await HelperFunction.getUserNameFromSF();
  }

  Future getCurrentUserId() async {
    user = FirebaseAuth.instance.currentUser;
  }
}
