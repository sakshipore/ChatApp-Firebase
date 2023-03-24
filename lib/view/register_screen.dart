import 'package:chat_app/controller/auth_controller.dart';
import 'package:chat_app/widgets/heading_text.dart';
import 'package:chat_app/widgets/my_button.dart';
import 'package:chat_app/widgets/my_text_form_field.dart';
import 'package:chat_app/widgets/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  HeadingText(
                    text: "Groupie",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  NormalText(
                    text: "Create your account now to chat and explore",
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Image.asset(
                    "assets/register.png",
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  MyTextFormField(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffee7b64),
                    ),
                    text: "Full Name",
                    controller: controller.nameController,
                  ),
                  SizedBox(
                    height: 10.h,
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
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    text: "Register",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  NormalText(text: "Already have an account? Login now"),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
