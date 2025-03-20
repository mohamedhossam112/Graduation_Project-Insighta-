import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/home/ui/widgets/custom_search_text_field.dart';
import 'package:insighta/features/home/ui/widgets/home_grid_view.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Discover',
            style: Styles.textStyle30,
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomSearchTextField(),
          SizedBox(height: 16.h),
          Expanded(child: HomeGridView()),
        ]),
      )),
    );
  }
}
