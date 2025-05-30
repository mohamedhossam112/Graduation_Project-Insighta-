import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/ui/widgets/already_have_account_text.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';
import 'package:insighta/features/auth/login/ui/widgets/continue_with_other_platform.dart';
import 'package:insighta/features/auth/login/ui/widgets/custom_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/login_image.png'),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Login to your account',
              style: Styles.textStyle20P,
            ),
            SizedBox(
              height: 16.h,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  const AppTextFormField(hintText: 'Email'),
                  SizedBox(
                    height: 16.h,
                  ),
                  AppTextFormField(
                    hintText: 'Password',
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
                    height: 18.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forgot Password?',
                      style: Styles.textStyle14P.copyWith(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  AppTextButton(
                    text: 'Login',
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
                  const AlreadyHaveAccountText(),
                ],
              ),
            ),
          ],
        )),
      ),
    ));
  }
}
