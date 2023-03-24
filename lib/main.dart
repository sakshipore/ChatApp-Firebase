import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/routes/routes.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initializes all the widgets
  if (kIsWeb) {
    // checks if the platform we are running is Web
    // then only initialize the Firebase for Web
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.projectId,
      ),
    );
  } else {
    // else the platform will be android or ios
    // then initialize the Firebase for Andoroid or IOS
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunction.getUserLoggedInStatus().then(
      (value) {
        if (value != null) {
          _isSignedIn = value;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 840),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: _isSignedIn ? RoutesNames.homeScreen : RoutesNames.loginScreen,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
