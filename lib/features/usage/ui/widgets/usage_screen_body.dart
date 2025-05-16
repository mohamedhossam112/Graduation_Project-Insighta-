import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/features/usage/ui/widgets/social_usage_bar_graph.dart';
import 'package:insighta/features/usage/ui/widgets/social_usage_card.dart';

class UsageScreenBody extends StatelessWidget {
  const UsageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: [
        SocialUsageBarChart(
          socialUsage: [60, 80, 40],
        ),
        SocialUsageCard(),
      ]),
    );
  }
}
