import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/helpers/log_out_helper.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(26.r),
        side: BorderSide(
          color: ColorsManager.primaryColor,
          width: 2.w,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 22.h,
          ),
          Icon(
            Icons.logout,
            color: Colors.red,
            size: 36.sp,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            'Are you sure you want to log out?',
            style: Styles.textStyle10I.copyWith(
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: ColorsManager.primaryColor,
            thickness: 0.6,
          ),
          SizedBox(
            height: 12.h,
          ),
          GestureDetector(
            onTap: () {
              LogoutHelper.logout();
            },
            child: Text(
              'Yes, log out now',
              style: Styles.textStyle12I.copyWith(
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            color: ColorsManager.primaryColor,
            thickness: 0.6,
          ),
          SizedBox(
            height: 12.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              'NO, Return',
              style: Styles.textStyle12I
                  .copyWith(color: ColorsManager.primaryColor),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}
