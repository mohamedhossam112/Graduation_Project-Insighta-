import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/profile/ui/widgets/profile_screen_item.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: Styles.textStyle24P,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            GestureDetector(
              onTap: () {},
              child: Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundImage:
                          AssetImage('assets/images/profile_image.png'),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 130,
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(height: 30.h),
            ProfileScreenItem(
              icon: Icons.person,
              title: 'Change Name',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            ProfileScreenItem(
              icon: Icons.delete_forever,
              title: 'Delete Account',
              titleStyle: Styles.textStyle16I
                  .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
              onTap: () {},
            ),
          ],
        ),
      )),
    );
    ;
  }
}
