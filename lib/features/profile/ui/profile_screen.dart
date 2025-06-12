import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/profile/ui/edit_profile_screen.dart';
import 'package:insighta/features/profile/ui/log_out_screen.dart';
import 'package:insighta/features/profile/ui/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<_ProfileOption> options = [
      _ProfileOption(Icons.person, 'Edit Profile', const EditProfileScreen()),
      _ProfileOption(Icons.settings, 'Settings', const SettingsScreen()),
      _ProfileOption(Icons.logout, 'Log out', const LogOutScreen()),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: Styles.textStyle24P,
        ),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        children: [
          SizedBox(height: 24.h),
          Center(
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: AssetImage('assets/images/profile_image.png'),
            ),
          ),
          SizedBox(height: 16.h),
          Center(
            child: Text(
              'Noha Elmahdy',
              style: Styles.textStyle20P,
            ),
          ),
          SizedBox(height: 30.h),
          ...options.map((option) => Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => option.destination),
                    );
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsManager.primaryColor),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: Row(
                      children: [
                        Icon(option.icon, color: ColorsManager.primaryColor),
                        SizedBox(width: 10.w),
                        Text(option.label,
                            style: Styles.textStyle16I.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      )),
    );
  }
}

class _ProfileOption {
  final IconData icon;
  final String label;
  final Widget destination;

  const _ProfileOption(this.icon, this.label, this.destination);
}
