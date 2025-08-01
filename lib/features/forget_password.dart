import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/custome_button.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bodyColor,
      body: Column(
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
                        "Forget Password",
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
                  ],
                ),
              ),
            ],
          ),

          Column(
            children: [
              Image.asset(
                "assets/images/Vector.png",
                width: 188.67,
                height: 168,
                fit: BoxFit.cover,
              ),
            ],
          ),

          // Bottom content
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(
              children: [
                CustomeButton(
                  text: "Send OTP",
                  width: 327,
                  height: 56,
                  onTap: () {},
                  btnColor: AppColor.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
