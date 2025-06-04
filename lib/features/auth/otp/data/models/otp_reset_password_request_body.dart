import 'package:json_annotation/json_annotation.dart';
part 'otp_reset_password_request_body.g.dart';
@JsonSerializable()
class OtpResetPasswordRequestBody {

  String otp;
  String password;
    @JsonKey(name: 'password_confirmation')
  String passwordConfirmation;

  OtpResetPasswordRequestBody(
      { required this.otp, required this.password, required this.passwordConfirmation});

 
  Map<String, dynamic> toJson()  => _$OtpResetPasswordRequestBodyToJson(this);
}