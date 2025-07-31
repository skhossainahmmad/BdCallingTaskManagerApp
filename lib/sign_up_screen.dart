import 'package:bdcallingtaskmanagerapp/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
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
                    "Join Now",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 35),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                CustomTextField(hintText: "Name"),
                SizedBox(height: 20),
                CustomTextField(hintText: "Email"),
                SizedBox(height: 20),
                CustomTextField(hintText: "Password"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
