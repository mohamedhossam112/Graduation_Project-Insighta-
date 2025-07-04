import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/helpers/app_regex.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';
import 'package:insighta/features/auth/login/ui/widgets/password_validations.dart';
import 'package:insighta/features/auth/sign_up/logic/signup_cubit/signup_cubit.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObsecureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late TextEditingController passwordConfirmationController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    passwordController =
        context.read<SignupCubit>().passwordConfirmationController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Enter your Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter valid Name';
              }
              return null;
            },
            controller: context.read<SignupCubit>().nameController,
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
              return null;
            },
            controller: context.read<SignupCubit>().emailController,
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
            controller: context.read<SignupCubit>().passwordController,
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
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Confirm Password',
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
            height: 16.h,
          ),
          AppTextFormField(
            hintText: 'Enter your Role',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Valid Role';
              }
              return null;
            },
            controller: context.read<SignupCubit>().roleController,
          ),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
