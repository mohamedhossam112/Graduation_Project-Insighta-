import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/features/auth/login/ui/widgets/app_text_button.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_request_body.dart';

import 'package:insighta/features/auth/otp/logic/otp_reset_pass_cubit/otp_reset_pass_cubit.dart';

import 'otp_text_field.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late OtpResetPassCubit cubit;
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<OtpResetPassCubit>(context);
    for (var controller in _controllers) {
      controller.addListener(_updateOtp);
    }
  }

  void _updateOtp() {
    final otp = _controllers.map((c) => c.text).join();
    context.read<OtpResetPassCubit>().enteredOtp = otp;
  }

  void _nextField({required String value, required int index}) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

  void _verifyOtp() async {
    bool isValid = true;

    for (var controller in _controllers) {
      if (controller.text.length != 1) {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      final otp = _controllers.map((c) => c.text).join();
      final email = await SharedPrefHelper.getEmail();
      final requestModel = OtpResetPasswordRequestBody(
        email: email,
        otp: otp,
      );
      await SharedPrefHelper.setSecuredString('otp', otp);
      cubit.verifyOtp(requestModel);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
            icon: Icon(
              Icons.error,
              size: 32.w,
              color: Colors.red,
            ),
            content: Text(
              'Please Enter The Correct OTP',
              style: Styles.textStyle16P.copyWith(
                fontSize: 12.sp,
              ),
            )),
      );
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return OtpTextField(
              index: index,
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              onChanged: (value) => _nextField(value: value, index: index),
            );
          }),
        ),
        SizedBox(
          height: 400.h,
        ),
        AppTextButton(
          onPressed: _verifyOtp,
          text: 'Continue',
          buttonheight: 80.h,
          textStyle: Styles.textStyle24P.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
