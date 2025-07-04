// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';

class InfoOfPieChart extends StatelessWidget {
  const InfoOfPieChart({
    super.key,
    required this.color,
    required this.platform,
  });
  final Color color;
  final String platform;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20.w,
          height: 13.h,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20.r)),
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          platform,
          style: Styles.textStyle18I.copyWith(fontSize: 14.sp),
        )
      ],
    );
  }
}
