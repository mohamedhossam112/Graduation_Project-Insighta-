import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/auth/login/data/models/login_response_body.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success({
    required LoginResponseBody loginResponse,
  }) = Success;
  const factory LoginState.error({required String error}) = Error;
}
