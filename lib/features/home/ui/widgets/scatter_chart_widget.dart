import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScatterChartWidget extends StatelessWidget {
  const ScatterChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260.h,
      width: 570.w,
      child: ScatterChart(
        ScatterChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) => Text(
                  value.toStringAsFixed(0),
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) => Text(
                value.toStringAsFixed(0),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            )),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Color(0xffCCCCCC), width: 2),
              bottom: BorderSide(color: Color(0xffCCCCCC), width: 2),
            ),
          ),
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 100,
        ),
      ),
    );
  }
}
