// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linked_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinkedAccountModel _$LinkedAccountModelFromJson(Map<String, dynamic> json) =>
    LinkedAccountModel(
      id: json['id'] as String,
      name: json['name'] as String,
      username: json['username'] as String,
      avatarImage: json['avatarImage'] as String?,
    );

Map<String, dynamic> _$LinkedAccountModelToJson(LinkedAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatarImage': instance.avatarImage,
    };
