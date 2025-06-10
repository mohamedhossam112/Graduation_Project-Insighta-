import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/core/networking/api_error_model.dart';
import 'package:insighta/features/auth/reset_password/data/models/reset_password_response_body.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loadingStoredData() = LoadingStoredData;
  const factory ResetPasswordState.storedDataLoaded({
    required bool isPasswordHidden,
    required bool isConfirmPasswordHidden,
  }) = StoredDataLoaded;
  const factory ResetPasswordState.loading() = Loading;
  const factory ResetPasswordState.success() = Success;
  const factory ResetPasswordState.error({required ApiErrorModel error}) =
      Error;
}
