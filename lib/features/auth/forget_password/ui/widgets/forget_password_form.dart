import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/helpers/app_regex.dart';
import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';

import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({super.key});

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ForgetPasswordCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<ForgetPasswordCubit>().emailController,
            hintText: 'Enter your Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please Enter Valid Email';
              }
            },
          ),
          SizedBox(
            height: 400.h,
          ),
          AppTextButton(
            text: 'Send',
            buttonheight: 60.h,
            textStyle: Styles.textStyle24P.copyWith(color: Colors.white),
            onPressed: () {
              submitForm(context,
                  context.read<ForgetPasswordCubit>().emailController.text);
            },
          ),
        ],
      ),
    );
  }
}

void submitForm(BuildContext context, String email) {
  final cubit = context.read<ForgetPasswordCubit>();
  if (cubit.formKey.currentState!.validate()) {
    cubit.resetPassword(email);
  }
}
