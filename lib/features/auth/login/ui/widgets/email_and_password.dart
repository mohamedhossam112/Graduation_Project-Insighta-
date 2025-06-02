import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_form_field.dart';
import 'package:insighta/features/auth/login/ui/widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLenght = false;
  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: context.read<LoginCubit>().emailController,
              hintText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Vakid Email';
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            AppTextFormField(
              controller: context.read<LoginCubit>().passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Valid Password';
                }
              },
              hintText: 'Password',
              isobscureText: isObsecureText,
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
              height: 18.h,
            ),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLenght: hasMinLenght,
            ),
          ],
        ));
  }
}
