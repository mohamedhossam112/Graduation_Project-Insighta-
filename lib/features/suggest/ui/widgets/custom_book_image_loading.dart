import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                color: Colors.grey[300],
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 16.h,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 14.h,
                  width: 120.w,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 14.h,
                  width: 80.w,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
