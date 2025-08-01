import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  const CustomTextField({super.key, this.hintText, required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromRGBO(255, 255, 255, 0.10),
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.textSecondaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: const Color.fromARGB(152, 255, 255, 255),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 2),
        ),
      ),
    );
  }
}
