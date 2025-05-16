import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340.w,
      height: 220.h,
      child: PieChart(PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: List.generate(
            3,
            (index) {
              List<Color> selectionColor = [
                Color(0xffd33d97),
                Color(0xff51b9ff),
                Color(0xff1877f2),
              ];
              double val = (index + 1 * 10);
              return PieChartSectionData(
                radius: 100.0.r,
                color: selectionColor[index],
              );
            },
          ))),
    );
  }
}
