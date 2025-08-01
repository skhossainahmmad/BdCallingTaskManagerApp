import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColor.bodyColor,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ) ,
      ) ,
    );
  }
}
