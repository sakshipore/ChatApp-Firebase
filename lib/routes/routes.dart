import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/view/chat_screen.dart';
import 'package:chat_app/view/group_info.dart';
import 'package:chat_app/view/home_screeen.dart';
import 'package:chat_app/view/login_screen.dart';
import 'package:chat_app/view/profile_screen.dart';
import 'package:chat_app/view/register_screen.dart';
import 'package:chat_app/view/search_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesNames.registerScreen,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: RoutesNames.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesNames.searchScreen,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: RoutesNames.profileScreen,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: RoutesNames.chatScreen,
      arguments: Map<String, dynamic>,
      page: () => ChatScreen(
        groupId: Get.arguments["groupId"],
        groupName: Get.arguments["groupName"],
        userName: Get.arguments["userName"],
      ),
    ),
    GetPage(
      name: RoutesNames.groupInfoScreen,
      arguments: Map<String, dynamic>,
      page: () => GroupInfo(
        groupId: Get.arguments["groupId"],
        groupName: Get.arguments["groupName"],
        adminName: Get.arguments["adminName"],
      ),
    ),
  ];
}
