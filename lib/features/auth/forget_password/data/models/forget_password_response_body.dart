import 'package:json_annotation/json_annotation.dart';
part 'forget_password_response_body.g.dart';
@JsonSerializable()
class ForgetPasswordResponseBody {
  String message;

  ForgetPasswordResponseBody({required this.message});

 factory ForgetPasswordResponseBody.fromJson(Map<String, dynamic> json) => _$ForgetPasswordResponseBodyFromJson(json);
  }