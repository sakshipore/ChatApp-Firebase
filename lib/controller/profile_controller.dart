import 'package:chat_app/helper/helper_function.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Map<String, dynamic> userData = {};
  // List<String?> userData = [];
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
}
