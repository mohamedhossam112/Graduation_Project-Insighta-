import 'package:json_annotation/json_annotation.dart';
part 'otp_reset_password_response_body.g.dart';
@JsonSerializable()
class OtpResetPasswordResponseBody {
  String message;

  OtpResetPasswordResponseBody({required this.message});

 factory OtpResetPasswordResponseBody.fromJson(Map<String, dynamic> json)=>

   _$OtpResetPasswordResponseBodyFromJson(json);
}