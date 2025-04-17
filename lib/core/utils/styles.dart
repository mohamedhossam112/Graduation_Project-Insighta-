import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

class Styles {
  static final textStyle30I = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static final textStyle18I = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: ColorsManager.searchFieldText,
  );

  static final textStyle16I = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: ColorsManager.white,
  );
  static final textStyle10I = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: ColorsManager.navBarText,
  );
  static final textStyle22I = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Color(0xff455A64),
  );
  static final textStyle12I = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: ColorsManager.cardText,
  );
  static final textStyle20I = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: ColorsManager.primaryColor,
  );
  static final textStyle24I = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: ColorsManager.primaryColor,
  );

  static final textStyle20P = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
    color: ColorsManager.primaryColor,
  );
  static final textStyle14P = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
    color: ColorsManager.therapyGrey,
  );
  static final textStyle24P = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: ColorsManager.primaryColor,
  );
}
