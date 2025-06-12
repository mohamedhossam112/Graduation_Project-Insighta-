import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/profile/ui/widgets/profile_screen_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Settings',
          style: Styles.textStyle24P,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            ProfileScreenItem(
              icon: Icons.info,
              title: 'About',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.aboutScreen);
              },
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.help,
              title: 'Help',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.helpScreen);
              },
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {
                Navigator.pushNamed(context, Routes.privacyPolicyScreen);
              },
            ),
          ],
        ),
      )),
    );
  }
}
