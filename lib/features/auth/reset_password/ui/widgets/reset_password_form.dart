/*
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/helpers/app_regex.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';
import 'package:insighta/features/auth/login/ui/widgets/password_validations.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  
  
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
    return  Column(
      children: [
     
     
      
        AppTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Valid Password';
            }
          },
        //  controller: context.read<SignupCubit>().passwordController,
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
        PasswordValidations(
          hasLowerCase: hasLowercase,
          hasUpperCase: hasUppercase,
          hasSpecialCharacters: hasSpecialCharacters,
          hasNumber: hasNumber,
          hasMinLength: hasMinLength,
        ),
      ],
    );;
  }
}*/
