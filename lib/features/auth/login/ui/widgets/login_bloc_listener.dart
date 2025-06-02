import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Sucess || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          },
          sucess: (loginResponse) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(Routes.homeScreen);
            /*   Navigator.pushNamedAndRemoveUntil(
  context,
  Routes.homeScreen,
  (route) => false,
);*/
          },
          error: (error) {
            Navigator.of(context).pop();
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          size: 32.w,
          color: Colors.red,
        ),
        content: Text(
          error,
          style: Styles.textStyle16P.copyWith(
            fontSize: 12.sp,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Got It',
                style: Styles.textStyle16P,
              ))
        ],
      ),
    );
  }
}
