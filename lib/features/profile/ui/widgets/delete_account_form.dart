// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:insighta/core/helpers/app_regex.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';
import 'package:insighta/features/profile/logic/delete_account_cubit/delete_account_cubit.dart';

class DeleteAccountForm extends StatefulWidget {
  const DeleteAccountForm({
    super.key,
  });

  @override
  State<DeleteAccountForm> createState() => _DeleteAccountFormState();
}

class _DeleteAccountFormState extends State<DeleteAccountForm> {
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<DeleteAccountCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Valid Password';
              }
              return null;
            },
            controller: context.read<DeleteAccountCubit>().passwordController,
            hintText: 'Enter your Password',
            isObscureText: isObsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecureText = !isObsecureText;
                });
              },
              child: Icon(
                  isObsecureText ? Icons.visibility_off : Icons.visibility),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          AppTextButton(
            text: 'Delete My Account',
            buttonheight: 60.h,
            textStyle: Styles.textStyle24P.copyWith(color: Colors.white),
            onPressed: () {
              submitForm(context,
                  context.read<DeleteAccountCubit>().passwordController.text);
            },
          ),
        ],
      ),
    );
  }
}

void submitForm(BuildContext context, String password) {
  final cubit = context.read<DeleteAccountCubit>();
  if (cubit.formKey.currentState!.validate()) {
    cubit.deleteAccount(password);
  }
}
