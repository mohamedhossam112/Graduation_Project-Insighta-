import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Divider(
            endIndent: 9.w,
          ),
        ),
        Text(
          'or Continue with',
          style: Styles.textStyle12I,
        ),
        Expanded(
          child: Divider(
            indent: 9.w,
          ),
        ),
      ],
    );
  }
}
