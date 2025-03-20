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
}
