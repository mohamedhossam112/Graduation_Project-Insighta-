import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';

class Styles {
  static final textStyle30 = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
  );

  static final textStyle18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: ColorsManager.searchFieldText,
  );

  static final textStyle16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: ColorsManager.white,
  );
  static final textStyle10 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
    color: ColorsManager.navBarText,
  );
  static final textStyle22 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
    color: Color(0xff455A64),
  );
}
