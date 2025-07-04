import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/utils/styles.dart';

class NotificationsListViewItem extends StatelessWidget {
  final String message;
  final String timeAgo;

  const NotificationsListViewItem({
    super.key,
    required this.message,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(),
                Text(
                  timeAgo,
                  style: Styles.textStyle12I,
                ),
              ],
            ),
            Text(message, style: Styles.textStyle14I.copyWith(fontSize: 16.sp)),
          ],
        ),
      ),
    );
  }
}
