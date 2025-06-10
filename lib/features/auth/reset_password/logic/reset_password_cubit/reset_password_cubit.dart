

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/core/networking/api_error_model.dart';
import 'package:insighta/features/auth/reset_password/data/models/reset_password_request_body.dart';
import 'package:insighta/features/auth/reset_password/data/repos/reset_password_repo.dart';
import 'package:insighta/features/auth/reset_password/logic/reset_password_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
 final ResetPasswordRepo _resetPasswordRepo;
  String? _email;
  String? _otp;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  ResetPasswordCubit(this._resetPasswordRepo) : super(const ResetPasswordState.initial()) {
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    emit(const ResetPasswordState.loadingStoredData());
    try {
      final email = await SharedPrefHelper.getString('email');
      final otp = await SharedPrefHelper.getSecuredString('otp');
      _email = email;
      _otp = otp;
      emit(ResetPasswordState.storedDataLoaded(
        isPasswordHidden: isPasswordHidden,
        isConfirmPasswordHidden: isConfirmPasswordHidden,
      ));
    } catch (error) {
      emit(ResetPasswordState.error(error:ApiErrorModel(message: 'Email or OTP not loaded')));
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    emit(ResetPasswordState.storedDataLoaded(
      isPasswordHidden: isPasswordHidden,
      isConfirmPasswordHidden: isConfirmPasswordHidden,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden = !isConfirmPasswordHidden;
    emit(ResetPasswordState.storedDataLoaded(
      isPasswordHidden: isPasswordHidden,
      isConfirmPasswordHidden: isConfirmPasswordHidden,
    ));
  }

  Future<void> resetPassword() async {
    if (_email == null || _otp == null) {
      emit(ResetPasswordState.error(error:  ApiErrorModel(message: 'Email or OTP not loaded')));
      return;
    }
    emit(const ResetPasswordState.loading());
    final requestModel = ResetPasswordRequestBody(
      email: _email!,
      otp: _otp!,
      password: newPasswordController.text,
     passwordConfirmation: confirmPasswordController.text,
    );
    final result = await _resetPasswordRepo.resetPassword(requestModel);
    result.when(
      success: (resetPasswordResponse) => emit(ResetPasswordState.success()),
      failure: (error) => emit(ResetPasswordState.error(error: ApiErrorModel(message: 'Email or OTP not loaded'))),
    );
  }

}
