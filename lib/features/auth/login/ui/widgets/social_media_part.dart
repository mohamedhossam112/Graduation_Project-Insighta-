// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:insighta/core/theming/colors.dart';

class SocialMediaPart extends StatelessWidget {
  const SocialMediaPart({
    super.key,
    required this.iconImage,
    this.onPressed,
  });
  final String iconImage;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 50.h,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorsManager.hintText, width: 1.5.w)),
      child:
          IconButton(onPressed: onPressed, icon: SvgPicture.asset(iconImage)),
    );
  }
}
