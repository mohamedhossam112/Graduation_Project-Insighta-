import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/profile/data/models/delete_account_response.dart';
part 'delete_account_state.freezed.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.initial() = _Initial;
  const factory DeleteAccountState.loading() = Loading;

  const factory DeleteAccountState.success(
      {required DeleteAccountResponse deleteAccountResponse}) = Success;
  const factory DeleteAccountState.error({required String error}) = Error;
}
