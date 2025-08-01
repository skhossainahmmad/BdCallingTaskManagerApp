import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/features/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<String> images = [
    'assets/images/btn_first_onbording.png',
    'assets/images/btn_second_onbording.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/bg_img_onbording.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "    Empowerment ",
                                style: TextStyle(
                                  color: AppColor.textOnbordingColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "Chakra Petch",
                                ),
                              ),
                              TextSpan(
                                text: "and control\n",
                                style: TextStyle(
                                  color: AppColor.textPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "Chakra Petch",
                                ),
                              ),
                              TextSpan(
                                text: "over the user's ",
                                style: TextStyle(
                                  color: AppColor.textPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "Chakra Petch",
                                ),
                              ),
                              TextSpan(
                                text: "drinking habits.",

                                style: TextStyle(
                                  color: AppColor.textOnbordingColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  fontFamily: "Chakra Petch",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          if (_currentIndex == images.length - 1) {
                            // Navigate to home or next screen
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (_) => LoginScreen()),
                            );
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            bottom: 36,
                            left: 36,
                            right: 36,
                          ),
                          child: Image.asset(images[index]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
