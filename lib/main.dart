import 'package:bdcallingtaskmanagerapp/features/splash_screen.dart';
import 'package:flutter/material.dart';
import 'core/get_di.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SplashScreen()),
    );
  }
}
