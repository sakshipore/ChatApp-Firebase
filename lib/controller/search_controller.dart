import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:chat_app/widgets/group_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchController extends GetxController {
  TextEditingController searchController = new TextEditingController();
  bool isLoading = true;
  QuerySnapshot? searchSnapshot;
  bool hasUserSearched = false;
  User? user;
  String? userName;
  bool isJoined = false;

  initiateSearchMethod() async {
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

  groupList() {
    return hasUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot!.docs.length,
            itemBuilder: (context, index) {
              joinedOrNot(
                  userName!,
                  searchSnapshot!.docs[index]['groupId'],
                  searchSnapshot!.docs[index]['groupName'],
                  searchSnapshot!.docs[index]['admin']);
              return GroupTile(
                groupId: searchSnapshot!.docs[index]['groupId'],
                groupName: searchSnapshot!.docs[index]['groupName'],
                userName: userName!,
                admin: searchSnapshot!.docs[index]['admin'],
              );
            },
          )
        : Container();
  }

  joinedOrNot(
      String userName, String groupId, String groupName, String admin) async {
    isJoined = await DatabaseService(uid: user!.uid)
        .isUserJoined(groupName, groupId, userName);

    update();
  }

  Future getCurrentUserName() async {
    userName = await HelperFunction.getUserNameFromSF();
  }

  Future getCurrentUserId() async {
    user = FirebaseAuth.instance.currentUser;
  }
}