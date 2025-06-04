import 'package:bloc/bloc.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_request_body.dart';

import 'package:insighta/features/auth/otp/data/repos/otp_reset_password_repo.dart';
import 'package:insighta/features/auth/otp/logic/otp_reset_pass_cubit/otp_reset_pass_state.dart';




class OtpResetPassCubit extends Cubit<OtpResetPassState> {
  final OtpResetPasswordRepo _otpResetPasswordRepo;
  String? enteredOtp;
  OtpResetPassCubit(this._otpResetPasswordRepo) : super(OtpResetPassState.initial());
    Future<void> verifyOtp(OtpResetPasswordRequestBody requestBody) async {
    emit(const OtpResetPassState.loading());
    final response = await _otpResetPasswordRepo.otpResetPassword(requestBody);

  response.when(success: (otpResetPassResponse) {
      emit(OtpResetPassState.success(response: otpResetPassResponse));
    }, failure: (error) {
      emit(OtpResetPassState.error(error: error.message ?? ''));
    });
  }
}
