import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColor.bodyColor,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/ellipse.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 68,
                            height: 68,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/maileProfile.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            children: [
                              Text(
                                "Welcome Back",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColor.textPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Chakra Petch",
                                ),
                              ),

                              Text(
                                "Jhon Smith",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Chakra Petch",
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),

                        child: Column(
                          children: [
                            Card(
                              elevation: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("My Business"),
                                      Text("01-08-25"),
                                    ],
                                  ),
                                  Text("-Business Name"),
                                  Text("-Brand Name"),
                                ],
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
          ],
        ),
      ),
    );
  }
}
