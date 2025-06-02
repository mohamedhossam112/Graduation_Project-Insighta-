import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  bool status;
  String message;
  String token;
  String verificationCode;

  SignupResponseBody(
      {required this.status,
      required this.message,
      required this.token,
      required this.verificationCode});

  factory SignupResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseBodyFromJson(json);
}
