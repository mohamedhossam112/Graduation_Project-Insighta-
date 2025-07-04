// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';

import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';

import 'package:insighta/features/auth/reset_password/logic/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatefulWidget {
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  const ResetPasswordForm({
    super.key,
    required this.isPasswordHidden,
    required this.isConfirmPasswordHidden,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late ResetPasswordCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<ResetPasswordCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Valid Password';
              }
              return null;
            },
            controller: cubit.newPasswordController,
            hintText: 'New Password',
            isObscureText: widget.isPasswordHidden,
            suffixIcon: IconButton(
              icon: Icon(
                widget.isPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: widget.isPasswordHidden
                    ? ColorsManager.primaryColor
                    : ColorsManager.therapyGrey,
              ),
              onPressed: cubit.togglePasswordVisibility,
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
              return null;
            },
            controller:
                context.read<ResetPasswordCubit>().confirmPasswordController,
            hintText: 'Confirm Password',
            isObscureText: widget.isConfirmPasswordHidden,
            suffixIcon: IconButton(
              icon: Icon(
                widget.isConfirmPasswordHidden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: widget.isConfirmPasswordHidden
                    ? ColorsManager.primaryColor
                    : ColorsManager.therapyGrey,
              ),
              onPressed: cubit.toggleConfirmPasswordVisibility,
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          AppTextButton(
            text: 'Change Password',
            buttonheight: 60.h,
            textStyle: Styles.textStyle24P.copyWith(color: Colors.white),
            onPressed: cubit.resetPassword,
          ),
        ],
      ),
    );
  }
}
