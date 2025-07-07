import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/report/ui/widgets/report_card.dart';

class ReportScreenBody extends StatelessWidget {
  const ReportScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ReportCard(
                platform: 'Facebook',
                color: ColorsManager.facebookColor,
                assetPath: 'assets/svgs/facebook_logo.svg'),
            ReportCard(
                platform: 'Instagram',
                color: ColorsManager.instagramColor,
                assetPath: 'assets/svgs/instagram_logo.svg'),
            ReportCard(
                color: ColorsManager.twitterColor,
                platform: 'Twitter',
                assetPath: 'assets/svgs/twitter_logo.svg')
          ],
        ),
      ),
    );
  }
}
