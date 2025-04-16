import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/home/ui/home_screen.dart';

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorsManager.searchField,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 2),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.r),
          child: BottomNavigationBar(
            iconSize: 18.r,
            elevation: 0,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
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
            unselectedItemColor: ColorsManager.searchFieldText,
          ),
        ),
      ),
    );
  }
}
