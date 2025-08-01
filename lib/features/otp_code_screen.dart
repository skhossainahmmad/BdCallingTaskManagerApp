import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/custome_button.dart';
import 'package:bdcallingtaskmanagerapp/core/widgets/custome_otp_field.dart';
import 'package:flutter/material.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key});

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  String _otpCode = '';

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
                        "Apply Code Here",
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
                "Please check your email. Give correct \n authentication code here",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.textPrimaryColor,
                  fontFamily: "Chakra Petch",
                ),
              ),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Replaced CustomTextField with CustomOtpField
                    CustomOtpField(
                      length: 4,
                      onCompleted: (otp) {
                        setState(() {
                          _otpCode = otp;
                        });
                      },
                      fieldSize: 50,
                      gapSize: 10,
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.textPrimaryColor,
                        fontFamily: "Chakra Petch",
                      ),
                      borderColor: AppColor.textPrimaryColor.withOpacity(0.5),
                      focusedBorderColor: AppColor.primaryColor,
                      borderRadius: 8,
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
                  text: "Apply Code",
                  width: 327,
                  height: 56,
                  onTap: () {
                    if (_otpCode.length == 6) {
                      // Handle OTP verification
                    } else {
                      // Show error for incomplete OTP
                    }
                  },
                  btnColor: AppColor.primaryColor,
                ),

                SizedBox(height: 16),

                CustomeButton(
                  text: "Send email again",
                  width: 327,
                  height: 56,
                  onTap: () {
                    // Resend OTP logic
                  },
                  btnColor: AppColor.ashColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
