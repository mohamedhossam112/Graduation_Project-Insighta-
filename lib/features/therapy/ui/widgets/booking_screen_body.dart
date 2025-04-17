import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/therapy/ui/widgets/date_button.dart';

class BookingScreenBody extends StatelessWidget {
  const BookingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 8.sp),
        child: Column(
          children: [
            DateButton(),
            SizedBox(
              height: 24.h,
            ),
            Divider(
              height: 1.h,
              thickness: 2,
              color: ColorsManager.primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
