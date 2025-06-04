import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/auth/sign_up/data/models/sign_up_response_body.dart';
part 'signup_state.freezed.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = Loading;
  const factory SignupState.success({
    required SignupResponseBody signupResponse,
  }) = Success;
  const factory SignupState.error({required String error}) = Error;
}
