import 'package:freezed_annotation/freezed_annotation.dart';

part 'facebook_login_state.freezed.dart';

@freezed
class FacebookLoginState with _$FacebookLoginState {
  const factory FacebookLoginState.initial() = _Initial;
  const factory FacebookLoginState.loading() = _Loading;
  const factory FacebookLoginState.success(Map<String, dynamic> userData) =
      _Success;
  const factory FacebookLoginState.error(String message) = _Error;
}
