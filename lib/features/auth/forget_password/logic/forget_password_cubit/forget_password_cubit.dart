import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/features/auth/forget_password/data/models/forget_password_request_body.dart';

import 'package:insighta/features/auth/forget_password/data/repos/forget_password_repo.dart';
import 'package:insighta/features/auth/forget_password/logic/forget_password_cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  void resetPassword(String email) async {
    emit(const ForgetPasswordState.loading());
    final response = await _forgetPasswordRepo
        .forgetPassword(ForgetPasswordRequestBody(email: emailController.text));

    response.when(success: (forgetPasswordResponseBody) async {
      await SharedPrefHelper.setData(SharedPrefKeys.email, email);
      emit(ForgetPasswordState.success(
          forgetPasswordResponse: forgetPasswordResponseBody));
    }, failure: (error) {
      emit(ForgetPasswordState.error(error: error.message ?? ''));
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }
}
