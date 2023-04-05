import 'package:chat_app/controller/message_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MessageController());
  }
}
