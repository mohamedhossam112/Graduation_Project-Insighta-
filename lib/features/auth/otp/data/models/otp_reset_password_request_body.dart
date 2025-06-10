import 'package:json_annotation/json_annotation.dart';
part 'otp_reset_password_request_body.g.dart';

@JsonSerializable()
class OtpResetPasswordRequestBody {
  String email;
  String otp;


  OtpResetPasswordRequestBody(
      {required this.otp,
   
      required this.email});

  Map<String, dynamic> toJson() => _$OtpResetPasswordRequestBodyToJson(this);
}
