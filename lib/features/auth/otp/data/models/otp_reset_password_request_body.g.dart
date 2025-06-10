// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_reset_password_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpResetPasswordRequestBody _$OtpResetPasswordRequestBodyFromJson(
        Map<String, dynamic> json) =>
    OtpResetPasswordRequestBody(
      otp: json['otp'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$OtpResetPasswordRequestBodyToJson(
        OtpResetPasswordRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
