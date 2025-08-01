import 'package:bdcallingtaskmanagerapp/features/onbording_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (_) => OnboardingScreen()),
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
            ),

            Center(
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 99,
                width: 210,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
