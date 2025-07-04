import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/ui/widgets/already_have_account_text.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';
import 'package:insighta/features/auth/login/ui/widgets/continue_with_other_platform.dart';
import 'package:insighta/features/auth/login/ui/widgets/custom_divider.dart';
import 'package:insighta/features/auth/sign_up/logic/signup_cubit/signup_cubit.dart';
import 'package:insighta/features/auth/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:insighta/features/auth/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            Column(
              children: [
                SignUpForm(),
                SizedBox(
                  height: 40.h,
                ),
                AppTextButton(
                  text: 'Sign Up',
                  buttonheight: 60.h,
                  textStyle: Styles.textStyle24P.copyWith(color: Colors.white),
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
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
                SignUpBlocListener(),
              ],
            ),
          ],
        )),
      ),
    ));
  }
}

void validateThenDoSignup(BuildContext context) {
  if (context.read<SignupCubit>().formKey.currentState!.validate()) {
    context.read<SignupCubit>().emitSignupStates();
  }
}
