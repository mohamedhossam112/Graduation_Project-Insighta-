import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/auth/forget_password/ui/widgets/forget_password_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                'Forget Password',
                style: Styles.textStyle24P.copyWith(fontSize: 32.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Enter the OTP sent to your Email',
                style: Styles.textStyle14P,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 36.h,
              ),
              //   ForgetPasswordForm(),
            ],
          )),
        ),
      ),
    );
  }
}
