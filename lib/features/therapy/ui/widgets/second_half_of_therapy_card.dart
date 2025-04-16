import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

class SecondHalfofTherapyCard extends StatelessWidget {
  const SecondHalfofTherapyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Prochaines disponibilites',
          style: Styles.textStyle14P
              .copyWith(color: ColorsManager.primaryColor, fontSize: 18.sp),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.start,
                'March',
                style: Styles.textStyle14P.copyWith(
                  color: ColorsManager.primaryColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Today',
                    style: Styles.textStyle14P,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'Tomorrow',
                    style: Styles.textStyle14P,
                  )
                ],
              )
            ],
          ),
        ),
        Wrap(
          spacing: 1,
          children: List.generate(7, (index) {
            return Chip(
              backgroundColor: Colors.white,
              shape: CircleBorder(
                side: BorderSide(color: ColorsManager.primaryColor),
              ),
              label: Text(
                "$index ",
                style: TextStyle(
                    fontSize: 12.sp, color: ColorsManager.primaryColor),
              ),
              labelStyle: TextStyle(fontSize: 10.sp),
              padding: EdgeInsets.zero,
            );
          }),
        ),
      ],
    );
  }
}
