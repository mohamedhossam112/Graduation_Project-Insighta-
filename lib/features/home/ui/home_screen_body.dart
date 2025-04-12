import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/home/ui/widgets/custom_search_text_field.dart';
import 'package:insighta/features/home/ui/widgets/scatter_chart_widget.dart';
import 'package:insighta/features/home/ui/widgets/home_grid_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: Styles.textStyle30,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomSearchTextField(),
            SizedBox(height: 14.h),
            Expanded(child: HomeGridView()),
            SizedBox(height: 14.h),
            Text(
              'Last Week',
              style: Styles.textStyle22,
            ),
            SizedBox(
              height: 18.h,
            ),
            ScatterChartWidget(),
          ],
        ),
      )),
    );
  }
}
