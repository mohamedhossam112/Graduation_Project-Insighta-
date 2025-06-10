import 'package:json_annotation/json_annotation.dart';
part 'reset_password_request_body.g.dart';
@JsonSerializable()
class ResetPasswordRequestBody {
  String email;
  String otp;
  String password;
    @JsonKey(name:'password_confirmation')
  String passwordConfirmation;

  ResetPasswordRequestBody(
      {required this.email, required this.otp, required this.password, required this.passwordConfirmation});

 

  Map<String, dynamic> toJson() =>_$ResetPasswordRequestBodyToJson(this);
}