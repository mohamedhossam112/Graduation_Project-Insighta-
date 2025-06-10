import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/auth/reset_password/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:insighta/features/auth/reset_password/logic/reset_password_cubit/reset_password_state.dart';
import 'package:insighta/features/auth/reset_password/ui/widgets/reset_password_bloc_listener.dart';
import 'package:insighta/features/auth/reset_password/ui/widgets/reset_password_form.dart';

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
            child: SafeArea(
                child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loadingStoredData: () =>
                      const Center(child: CircularProgressIndicator()),
                  storedDataLoaded: (isPasswordHidden,
                          isConfirmPasswordHidden) =>
                      _buildContent(isPasswordHidden, isConfirmPasswordHidden),
                  loading: () => _buildContent(
                    context.read<ResetPasswordCubit>().isPasswordHidden,
                    context.read<ResetPasswordCubit>().isConfirmPasswordHidden,
                  ),
                  success: () => const SizedBox.shrink(),
                  error: (error) =>
                      Center(child: Text(error.getAllErrorMessages())),
                );
              },
            ))),
      ),
    );
  }

  Widget _buildContent(bool isPasswordHidden, bool isConfirmPasswordHidden) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Reset Your Password',
          style: Styles.textStyle24P,
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
        ResetPasswordForm(
          isPasswordHidden: isPasswordHidden,
          isConfirmPasswordHidden: isConfirmPasswordHidden,
        ),
        ResetPasswordListener(),
      ],
    );
  }
}
