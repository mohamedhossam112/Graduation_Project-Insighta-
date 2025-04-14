import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/features/report/ui/widgets/card.dart';

class ReportScreenBody extends StatelessWidget {
  ReportScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReportCard(
                platform: 'Facebook',
                assetPath: 'assets/svgs/facebook_logo.svg'),
            ReportCard(
                platform: 'Instagram',
                assetPath: 'assets/svgs/instagram_logo.svg'),
            ReportCard(
                platform: 'Twitter', assetPath: 'assets/svgs/twitter_logo.svg')
          ],
        ),
      ),
    );
  }
}
