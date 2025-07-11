import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

class ScatterChartWidget extends StatelessWidget {
  const ScatterChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ScatterSpot> scatterSpots = [
      // Facebook
      ScatterSpot(
        3,
        1.5,
        dotPainter: FlDotCirclePainter(color: ColorsManager.facebookColor),
      ),
      ScatterSpot(
        9,
        1.8,
        dotPainter: FlDotCirclePainter(color: ColorsManager.facebookColor),
      ),
      ScatterSpot(12, 3.9,
          dotPainter: FlDotCirclePainter(color: ColorsManager.facebookColor)),
      ScatterSpot(17, 4.1,
          dotPainter: FlDotCirclePainter(color: ColorsManager.facebookColor)),

      // Instagram
      ScatterSpot(
        18,
        1.9,
        dotPainter: FlDotCirclePainter(color: ColorsManager.instagramColor),
      ),
      ScatterSpot(
        2,
        5,
        dotPainter: FlDotCirclePainter(color: ColorsManager.instagramColor),
      ),
      ScatterSpot(
        2.5,
        5.6,
        dotPainter: FlDotCirclePainter(color: ColorsManager.instagramColor),
      ),
      ScatterSpot(
        2.8,
        6.2,
        dotPainter: FlDotCirclePainter(color: ColorsManager.instagramColor),
      ),
      ScatterSpot(
        3.4,
        6,
        dotPainter: FlDotCirclePainter(color: ColorsManager.instagramColor),
      ),
      ScatterSpot(
        5.5,
        4.4,
        dotPainter: FlDotCirclePainter(color: ColorsManager.instagramColor),
      ),

      // Twitter
      ScatterSpot(
        10.5,
        6,
        dotPainter: FlDotCirclePainter(color: ColorsManager.twitterColor),
      ),
      ScatterSpot(
        12.5,
        5.2,
        dotPainter: FlDotCirclePainter(color: ColorsManager.twitterColor),
      ),
      ScatterSpot(
        17.5,
        5,
        dotPainter: FlDotCirclePainter(color: ColorsManager.twitterColor),
      ),
      ScatterSpot(
        22,
        4.5,
        dotPainter: FlDotCirclePainter(color: ColorsManager.twitterColor),
      ),
      ScatterSpot(
        12.5,
        5.8,
        dotPainter: FlDotCirclePainter(color: ColorsManager.twitterColor),
      ),
      ScatterSpot(
        20,
        5.1,
        dotPainter: FlDotCirclePainter(color: ColorsManager.twitterColor),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 260.h,
          width: 570.w,
          child: ScatterChart(
            ScatterChartData(
              scatterSpots: scatterSpots,
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                rightTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    getTitlesWidget: (value, meta) => Text(
                      value.toStringAsFixed(0),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget: (value, meta) => Text(
                      value.toStringAsFixed(0),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                topTitles:
                    AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  left: BorderSide(color: Color(0xffCCCCCC), width: 2),
                  bottom: BorderSide(color: Color(0xffCCCCCC), width: 2),
                ),
              ),
              minX: 1,
              maxX: 24,
              minY: 1,
              maxY: 7,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              _buildLegendDot(ColorsManager.facebookColor, "Facebook"),
              const SizedBox(width: 12),
              _buildLegendDot(ColorsManager.instagramColor, "Instagram"),
              const SizedBox(width: 12),
              _buildLegendDot(ColorsManager.twitterColor, "Twitter"),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildLegendDot(Color color, String label) {
  return Row(
    children: [
      Container(
        width: 10.w,
        height: 12.h,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      SizedBox(width: 4.w),
      Text(label,
          style:
              Styles.textStyle14I.copyWith(color: ColorsManager.primaryColor)),
    ],
  );
}
