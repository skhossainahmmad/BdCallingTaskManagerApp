import 'package:bdcallingtaskmanagerapp/core/constants/app_color.dart';
import 'package:bdcallingtaskmanagerapp/features/home/date_screen.dart';
import 'package:bdcallingtaskmanagerapp/features/home/home_screen.dart';
import 'package:bdcallingtaskmanagerapp/features/home/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    DateScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1)),
          ],
        ),
        child: SafeArea(
          child: Container(
            color: AppColor.ashColor,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GNav(
                backgroundColor: AppColor.ashColor,
                tabBackgroundColor: AppColor.primaryColor,
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                duration: const Duration(milliseconds: 400),
                tabBorderRadius: 100,
                color: Colors.white,
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                tabs: [
                  GButton(
                    icon: Icons.home,
                    leading: Image.asset(
                      'assets/images/ic_home.png',
                      width: 44,
                      height: 44,
                      color: Colors.white,
                    ),
                    text: 'Home',
                    textStyle: TextStyle(
                      fontFamily: "Chakra Petch", // Specific to this tab
                      fontSize: 14,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                  GButton(
                    icon: Icons.date_range,
                    leading: Image.asset(
                      'assets/images/ic_calendar.png',
                      width: 44,
                      height: 44,
                      color: Colors.white,
                    ),
                    text: 'Date',
                    textStyle: TextStyle(
                      fontFamily: "Chakra Petch", // Specific to this tab
                      fontSize: 14,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                  GButton(
                    icon: Icons.more_horiz,
                    leading: Image.asset(
                      'assets/images/ic_more.png',
                      width: 44,
                      height: 44,
                      color: Colors.white,
                    ),
                    text: 'More',
                    textStyle: TextStyle(
                      fontFamily: "Chakra Petch", // Specific to this tab
                      fontSize: 14,
                      color: AppColor.textPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
