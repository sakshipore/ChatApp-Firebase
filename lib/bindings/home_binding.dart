import 'package:chat_app/controller/groups_controller.dart';
import 'package:chat_app/controller/profile_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(GroupsController());
  }
}
