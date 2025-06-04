import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_response_body.dart';
import 'package:insighta/features/auth/otp/data/repos/otp_reset_password_repo.dart';
part 'otp_reset_pass_state.freezed.dart';

@freezed
class OtpResetPassState with _$OtpResetPassState {
  const factory OtpResetPassState.initial() = _Initial;
  const factory OtpResetPassState.loading() = Loading;
  const factory OtpResetPassState.success( {
    required OtpResetPasswordResponseBody response,
  }) = Success;
  const factory OtpResetPassState.error({required String error}) = Error;
}
