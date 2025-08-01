import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/core/get_di.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/custome_button.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/text_field.dart';
import 'package:bdcallingtaskmanagerapp/features/login/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bdcallingtaskmanagerapp/features/registration/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../core/widgets/Utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final controller = getIt<RegisterController>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleSignUp() async {
    final fullName = _fullNameController.text.trim();
    final password = _passwordController.text.trim();
    final email = _emailController.text.trim();
    // var logger = Logger();
    // logger.e(
    //   'Error',
    //   error: 'Name: $fullName , Email:$email,Password:$password',
    // );
    if ((fullName.trim().isEmpty) ||
        (password.trim().isEmpty) ||
        (email.trim().isEmpty)) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: 'Please enter all required fields',
        btnCancelOnPress: () {},
      ).show();

      return;
    } else {
      showLoadingDialog(context, message: "Registering, please wait...");
      controller.register(
        fullName: fullName.trim(),
        email: email.trim(),
        password: password.trim(),
        onSuccess: (data) {
          Navigator.pop(context);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: 'Success',
            desc: 'You have registered successfully!',
            btnOkOnPress: () {},
          ).show();

        },
        onError: (msg) {
          Navigator.pop(context);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.rightSlide,
            title: 'Warning',
            desc: 'Registration failed. Please try again.',
            btnCancelOnPress: () {},
          ).show();

        },
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.bodyColor,
      body:
     //  Obx(() {})
     // return

       SingleChildScrollView(
        child:
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top content
          Column(
            children: [
              Container(
                width: 450,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/ellipse.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Text(
                        "Join Now",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Star your journey mastering money with fun \n imteractive lessons today ",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: "Name",
                      controller: _fullNameController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Email",
                      controller: _emailController,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Password",
                      controller: _passwordController,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 150),
          // Bottom content
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "By continuing, you agree to the Boundless inc",
                        style: TextStyle(
                          color: AppColor.textSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "SF Pro Display",
                        ),
                      ),
                      TextSpan(
                        text: " Terms & \n Conditions",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "SF Pro Display",
                        ),
                      ),
                      TextSpan(
                        text: " and",
                        style: TextStyle(
                          color: AppColor.textSecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "SF Pro Display",
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          fontFamily: "SF Pro Display",
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
                SizedBox(height: 20),
                CustomeButton(
                  text: "Sign Up ",
                  width: 327,
                  height: 56,
                  onTap: () {
                    _handleSignUp();
                  },
                  btnColor: AppColor.primaryColor,
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            color: AppColor.textSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "SF Pro Display",
                          ),
                        ),
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            fontFamily: "SF Pro Display",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      )


    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
