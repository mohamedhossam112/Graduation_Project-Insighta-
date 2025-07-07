import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/usage/ui/widgets/custom_pie_chart.dart';
import 'package:insighta/features/usage/ui/widgets/info_of_pie_chart.dart';

class SocialUsageCard extends StatelessWidget {
  const SocialUsageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 18.h,
        horizontal: 16.w,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffC8C3C3)),
        borderRadius: BorderRadius.circular(12.r),
      ),
      color: ColorsManager.lightGrey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              'Social Media Usage Over \nDay',
              style: Styles.textStyle20P,
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomPieChart(),
            InfoOfPieChart(
                color: ColorsManager.instagramColor, platform: 'Instagram'),
            InfoOfPieChart(
                color: ColorsManager.twitterColor, platform: 'Twitter'),
            InfoOfPieChart(
                color: ColorsManager.facebookColor, platform: 'Facebook'),
          ],
        ),
      ),
    );
  }
}
