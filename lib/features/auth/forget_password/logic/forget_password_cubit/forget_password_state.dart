import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/auth/forget_password/data/models/forget_password_response_body.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = Loading;
  const factory ForgetPasswordState.success(
      {required ForgetPasswordResponseBody forgetPasswordResponse}) = Success;
  const factory ForgetPasswordState.error({required String error}) = Error;
}
