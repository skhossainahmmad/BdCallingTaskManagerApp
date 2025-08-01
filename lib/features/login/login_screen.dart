import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/custome_button.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/text_field.dart';
import 'package:bdcallingtaskmanagerapp/features/forget/forget_password.dart';
import 'package:bdcallingtaskmanagerapp/features/home/home_screen.dart';
import 'package:bdcallingtaskmanagerapp/features/registration/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                        "Login Here",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.textPrimaryColor,
                          fontFamily: "Chakra Petch",
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
                style: TextStyle(
                  color: AppColor.textPrimaryColor,
                  fontFamily: "Chakra Petch",
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Email",
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Password",
                    ),
                    SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: "SF Pro Display",
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 180),
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
                  text: "Login ",
                  width: 327,
                  height: 56,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (_) => BottomBar()),
                    );

                  },
                  btnColor: AppColor.primaryColor,
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (_) => SignUpScreen()),
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
                          text: "Sing Up",
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
}
