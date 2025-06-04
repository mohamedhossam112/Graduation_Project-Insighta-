import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/data/models/login_request_body.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:insighta/features/auth/login/ui/widgets/already_have_account_text.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';

import 'package:insighta/features/auth/login/ui/widgets/continue_with_other_platform.dart';
import 'package:insighta/features/auth/login/ui/widgets/custom_divider.dart';
import 'package:insighta/features/auth/login/ui/widgets/email_and_password.dart';
import 'package:insighta/features/auth/login/ui/widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            Column(
              children: [
                const EmailAndPassword(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/forgetPasswordScreen');
                  },
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forgot Password?',
                      style: Styles.textStyle14P.copyWith(
                          color: ColorsManager.primaryColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppTextButton(
                  text: 'Login',
                  buttonheight: 60.h,
                  textStyle: Styles.textStyle24P.copyWith(color: Colors.white),
                  onPressed: () {
                    validateThenDoLogin(context);
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
                  text1: 'Don\'t have an account?',
                  text2: ' Sign Up',
                  path: '/signUpScreen',
                ),
                LoginBlocListener(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.otpScreen);
                    },
                    icon: Icon(Icons.add_ic_call_outlined))
              ],
            ),
          ],
        )),
      ),
    ));
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
