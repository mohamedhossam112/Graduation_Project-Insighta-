import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/otp/logic/otp_reset_pass_cubit/otp_reset_pass_cubit.dart';
import 'package:insighta/features/auth/otp/logic/otp_reset_pass_cubit/otp_reset_pass_state.dart';

class OtpBlocListener extends StatelessWidget {
  const OtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpResetPassCubit, OtpResetPassState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              ),
            );
          },
          success: (data) {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(Routes.resetPasswordScreen);
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
