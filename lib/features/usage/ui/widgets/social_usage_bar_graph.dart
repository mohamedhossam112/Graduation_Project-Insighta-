// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/usage/data/bar_data.dart';

class SocialUsageBarChart extends StatelessWidget {
  const SocialUsageBarChart({
    super.key,
    required this.socialUsage,
  });
  final List<double> socialUsage;
  @override
  Widget build(BuildContext context) {
    BarData mybarData = BarData(
        instaUse: socialUsage[0],
        twitUse: socialUsage[1],
        faceUse: socialUsage[2]);

    return SizedBox(
        width: 340.w,
        height: 260.h,
        child: Card(
          color: ColorsManager.lightGrey,
          child: BarChart(
            BarChartData(
              barGroups: mybarData.barDataList
                  .map(
                    (data) => BarChartGroupData(
                      x: data.x,
                      barRods: [
                        BarChartRodData(
                          toY: data.y,
                          width: 30.w,
                          color: ColorsManager.primaryColor,
                          borderRadius: BorderRadius.circular(2.r),
                        )
                      ],
                    ),
                  )
                  .toList(),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getSocialIcon,
                    reservedSize: 40,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ));
  }
}

Widget getSocialIcon(double value, TitleMeta meta) {
  const iconPaths = [
    'assets/svgs/instagram_logo.svg',
    'assets/svgs/twitter_logo.svg',
    'assets/svgs/facebook_logo.svg',
  ];

  return Padding(
    padding: EdgeInsets.only(top: 8.h),
    child: SizedBox(
      width: 50.w,
      height: 50.h,
      child: SvgPicture.asset(
        iconPaths[value.toInt()],
      ),
    ),
  );
}
