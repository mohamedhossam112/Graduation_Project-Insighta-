// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:intl/intl.dart';

class BookingSuccessScreenBody extends StatelessWidget {
  const BookingSuccessScreenBody({
    Key? key,
    required this.date,
    required this.time,
  }) : super(key: key);
  final DateTime date;
  final String time;
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('d MMMM').format(date);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textAlign: TextAlign.center,
            'Booking Successful',
            style: Styles.textStyle30I
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          Image.asset(
            'assets/images/check_mark.png',
            color: ColorsManager.primaryColor,
          ),
          Text(
            formattedDate + ', ' + time,
            style: Styles.textStyle24I.copyWith(color: Colors.black),
          ),
          SizedBox(
            height: 16.h,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 16.h),
              child: Text(
                'Done',
                style: Styles.textStyle24I.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
