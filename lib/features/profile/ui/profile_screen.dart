import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';

import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/profile/ui/widgets/logout_dialog.dart';
import 'package:insighta/features/profile/ui/widgets/profile_screen_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: Styles.textStyle20P,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
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
            ProfileScreenItem(
              icon: Icons.person,
              title: 'Edit Profile',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.editProfileScreen);
              },
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.settings,
              title: 'Settings',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.settingsScreen);
              },
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.logout,
              title: 'Log Out',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.red),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutDialog(),
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
