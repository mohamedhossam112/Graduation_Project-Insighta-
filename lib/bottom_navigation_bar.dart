import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/home/ui/home_screen.dart';
import 'package:insighta/features/report/ui/report_screen.dart';

// ignore: camel_case_types
class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),

    // ProfileScreen(),
    // NotificationScreen(),
    // SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 2.h,
            color: Color(0xffE5E7EB),
          ),
          BottomNavigationBar(
            iconSize: 18.r,
            backgroundColor: Color(0xffEBE7E7),
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.house), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.user), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bell), label: "Notification"),
              BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.gear), label: "Setting"),
            ],
            selectedItemColor: ColorsManager.primaryColor,
            unselectedItemColor: ColorsManager.navBarText,
          ),
        ],
      ),
    );
  }
}
