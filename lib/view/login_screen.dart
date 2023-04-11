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

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Groupie",
                            style: MyTextStyle.headingTextStyle
                                .copyWith(color: Colors.deepPurple),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Login now to see what they are talking",
                            style: MyTextStyle.normalTextStyle,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Image.asset(
                            "assets/images/login.png",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextFormField(
                            icon: Icon(
                              Icons.mail,
                              color: Colors.deepPurple,
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
                              color: Colors.deepPurple,
                            ),
                            text: "Password",
                            controller: controller.passwordController,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          MyButton(
                            onTap: () async {
                              await controller.login();
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
                            child: Text(
                              "Don't have an account? Register here",
                              style: MyTextStyle.normalTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
