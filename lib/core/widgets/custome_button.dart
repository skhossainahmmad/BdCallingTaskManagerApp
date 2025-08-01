import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color btnColor;
  final VoidCallback onTap;
  const CustomeButton({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    required this.onTap,
    required this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: btnColor),
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.textPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: "SF Pro Display",
          ),
        ),
      ),
    );
  }
}
