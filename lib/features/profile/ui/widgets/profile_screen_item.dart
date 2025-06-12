import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

class ProfileScreenItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final TextStyle titleStyle;
  final void Function()? onTap;

  const ProfileScreenItem({
    super.key,
    required this.icon,
    required this.title,
    required this.titleStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.primaryColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            icon,
            color: ColorsManager.primaryColor,
          ),
          title: Text(
            title,
            style: titleStyle,
          ),
        ),
      ),
    );
  }
}
