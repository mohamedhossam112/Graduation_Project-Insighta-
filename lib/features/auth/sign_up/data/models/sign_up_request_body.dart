import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  String name;
  String email;
  String password;
   @JsonKey(name: 'password_confirmation')
   String passwordConfirmation;
  String role;

  SignupRequestBody(
      {required this.name,
      required this.email,
      required this.password,
       required this.passwordConfirmation,
      required this.role});

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
