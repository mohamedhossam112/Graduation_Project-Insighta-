// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseBody _$SignupResponseBodyFromJson(Map<String, dynamic> json) =>
    SignupResponseBody(
      status: json['status'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
      verificationCode: json['Verification Code'] as String?,
    );

Map<String, dynamic> _$SignupResponseBodyToJson(SignupResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'Verification Code': instance.verificationCode,
    };
