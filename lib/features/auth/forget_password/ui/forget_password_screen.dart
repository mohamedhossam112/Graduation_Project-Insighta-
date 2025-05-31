import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
                'it is a long established fact that a reader will be distabled by the readable content',
                style: Styles.textStyle14P,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 36.h,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const AppTextFormField(hintText: 'Enter your Email'),
                    SizedBox(
                      height: 400.h,
                    ),
                    AppTextButton(
                      text: 'Send',
                      buttonheight: 60.h,
                      textStyle:
                          Styles.textStyle24P.copyWith(color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
