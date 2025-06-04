// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResetPasswordRequestBody _$OtpResetPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    OtpResetPasswordRequestBody(
      otp: json['otp'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );

Map<String, dynamic> _$OtpResetPasswordRequestBodyToJson(
        OtpResetPasswordRequestBody instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
