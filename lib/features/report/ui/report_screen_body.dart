import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/features/report/ui/widgets/card.dart';

class ReportScreenBody extends StatelessWidget {
  const ReportScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              reportCard(key, 'Facebook', 'assets/svgs/facebook_logo.svg'),
              reportCard(key, 'Instagram', 'assets/svgs/instagram_logo.svg'),
              reportCard(key, 'Twitter', 'assets/svgs/twitter_logo.svg')
            ],
          ),
        ));
  }
}
