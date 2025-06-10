import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Reset Your Password',
                style: Styles.textStyle24P.copyWith(fontSize: 32.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Enter a new password below to update your account security',
                style: Styles.textStyle14P,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 36.h,
              ),
            //  ResetPasswordForm(),
             // ResetPasswordBlocListener(),
            ],
          )),
        ),
      ),
    );;
  }
}
