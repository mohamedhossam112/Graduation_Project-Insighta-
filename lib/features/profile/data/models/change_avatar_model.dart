import 'package:json_annotation/json_annotation.dart';
part 'change_avatar_model.g.dart';

@JsonSerializable()
class UserModel {
  final int id;
  final String name;
  final String email;
  final String avatar;
  final String role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
        Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class AvatarResponse {
  final String message;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  final UserModel user;

  AvatarResponse({
    required this.message,
    required this.avatarUrl,
    required this.user,
  });

  factory AvatarResponse.fromJson(Map<String, dynamic> json) =>
      _$AvatarResponseFromJson(json);
    Map<String, dynamic> toJson() => _$AvatarResponseToJson(this);
}
