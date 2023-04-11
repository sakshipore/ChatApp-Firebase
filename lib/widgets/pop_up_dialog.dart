import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

popUpDialog(
    BuildContext context, String userName, String userId) {
  GroupsController groupsController = Get.find<GroupsController>();
  bool isLoading = false;
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          title: Text(
            "Create Group",
            textAlign: TextAlign.left,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                      ),
                    )
                  : MyTextField(),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffee7b64),
              ),
              child: Text("CANCEL"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (groupsController.groupsController.text != "") {
                  await groupsController.setGroupName(
                      userName, userId, groupsController.groupsController.text);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text("CREATE"),
            ),
          ],
        );
      });
    },
  );
}
