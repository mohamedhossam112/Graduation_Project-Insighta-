import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/ui/widgets/already_have_account_text.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';
import 'package:insighta/features/auth/login/ui/widgets/continue_with_other_platform.dart';
import 'package:insighta/features/auth/login/ui/widgets/custom_divider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Styles.textStyle24P,
            ),
            SizedBox(
              height: 36.h,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    hintText: 'Enter your Name',
                    validator: (value) {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextFormField(
                    hintText: 'Enter your Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Valid Email';
                      }
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Valid Password';
                      }
                    },
                    hintText: 'Enter your Password',
                    isobscureText: isObsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecureText = !isObsecureText;
                        });
                      },
                      child: Icon(isObsecureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Valid Password';
                      }
                    },
                    hintText: 'Confirm your Password',
                    isobscureText: isObsecureText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObsecureText = !isObsecureText;
                        });
                      },
                      child: Icon(isObsecureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppTextButton(
                    text: 'Sign Up',
                    buttonheight: 60.h,
                    textStyle:
                        Styles.textStyle24P.copyWith(color: Colors.white),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomDivider(),
                  SizedBox(
                    height: 24.h,
                  ),
                  ContinueWithOtherPlatform(),
                  SizedBox(
                    height: 60.h,
                  ),
                  AlreadyHaveAccountText(
                    text1: 'Already have an account?',
                    text2: ' Log In',
                    path: '/logInScreen',
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
