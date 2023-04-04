import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffee7b64),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("Groupie", style: MyTextStyle.headingStyle),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text("Login now to see what they are talking",
                            style: MyTextStyle.normalStyle),
                        SizedBox(
                          height: 40.h,
                        ),
                        Image.asset(
                          "assets/login.png",
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        MyTextFormField(
                          icon: Icon(
                            Icons.mail,
                            color: Color(0xffee7b64),
                          ),
                          text: "Email",
                          controller: controller.emailController,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        MyTextFormField(
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xffee7b64),
                          ),
                          text: "Password",
                          controller: controller.passwordController,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        MyButton(
                          onTap: () async {
                            // bool? isRegistered = false;
                            await controller.login();
                            // log(isRegistered.toString());
                            // if (isRegistered == true) {
                            //   Get.toNamed(RoutesNames.homeScreen);
                            // }
                          },
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          text: "Login",
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              RoutesNames.registerScreen,
                            );
                          },
                          child: Text("Don't have an account? Register here",
                              style: MyTextStyle.normalStyle),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
