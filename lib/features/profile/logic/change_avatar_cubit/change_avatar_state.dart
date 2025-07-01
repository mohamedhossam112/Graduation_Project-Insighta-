import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/core/networking/api_error_model.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/features/profile/data/models/change_avatar_model.dart';
part 'change_avatar_state.freezed.dart';

@freezed
class ChangeAvatarState with _$ChangeAvatarState {
  const factory ChangeAvatarState.initial() = _Initial;
  const factory ChangeAvatarState.loading() = Loading;
  const factory ChangeAvatarState.success(AvatarResponse response) = Success;
  const factory ChangeAvatarState.error({required ApiErrorModel error}) = Error;
}
