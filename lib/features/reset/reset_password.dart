import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/custome_button.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
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
                        "Reset Password Here",
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
                "Reset your account password here ",
                maxLines: 1,
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
                      controller: _passwordController,
                      hintText: "New Password",
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _confirmPasswordController,
                      hintText: "Confirm Password",
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Bottom content
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
            child: Column(
              children: [
                CustomeButton(
                  text: "Reset Password",
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
