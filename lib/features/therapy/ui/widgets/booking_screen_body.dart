import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/therapy/ui/widgets/date_select_list_view.dart';

class BookingScreenBody extends StatelessWidget {
  const BookingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.sp),
      child: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          SizedBox(height: 100.h, child: DateSelectListView()),
          SizedBox(
            height: 24.h,
          ),
          Divider(
            height: 1.h,
            thickness: 1,
            color: ColorsManager.primaryColor,
          )
        ],
      ),
    );
  }
}
