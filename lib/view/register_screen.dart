import 'package:chat_app/constants/text_style.dart';
import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/routes/routes_names.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

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
                            style: MyTextStyle.headingTextStyle.copyWith(color: Colors.deepPurple),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Create your account now to chat and explore",
                            style: MyTextStyle.normalTextStyle,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Image.asset(
                            "assets/images/register.png",
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          MyTextFormField(
                            icon: Icon(
                              Icons.person,
                              color: Colors.deepPurple,
                            ),
                            text: "Full Name",
                            controller: controller.fullNameController,
                          ),
                          SizedBox(
                            height: 10.h,
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
                              await controller.register();
                            },
                            height: 40.h,
                            width: MediaQuery.of(context).size.width,
                            text: "Register",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(RoutesNames.loginScreen);
                            },
                            child: Text(
                              "Already have an account? Login now",
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
