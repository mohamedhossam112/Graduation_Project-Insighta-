import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/utils/styles.dart';

class TitleAndSubtitleCoreProfileItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleAndSubtitleCoreProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 0.2,
          height: 0.2.h,
        ),
        SizedBox(
          height: 12.h,
        ),
        Text(
          title,
          style: Styles.textStyle12I.copyWith(color: Colors.black87),
        ),
        Text(subtitle, style: Styles.textStyle12I),
        SizedBox(
          height: 12.h,
        ),
      ],
    );
  }
}
