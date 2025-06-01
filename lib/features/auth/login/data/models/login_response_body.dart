import 'package:json_annotation/json_annotation.dart';
part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  bool? status;
  String? message;
  String? token;

  LoginResponseBody({this.status, this.message, this.token});

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseBodyFromJson(json);
}
