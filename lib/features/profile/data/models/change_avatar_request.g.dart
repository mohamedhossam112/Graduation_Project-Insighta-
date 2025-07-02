// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_avatar_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeAvatarRequest _$ChangeAvatarRequestFromJson(Map<String, dynamic> json) =>
    ChangeAvatarRequest(
      profileImageUrl:
          FileConverter.fromJson(json['profileImageUrl'] as String?),
    );

Map<String, dynamic> _$ChangeAvatarRequestToJson(
        ChangeAvatarRequest instance) =>
    <String, dynamic>{
      'profileImageUrl': FileConverter.toJson(instance.profileImageUrl),
    };
