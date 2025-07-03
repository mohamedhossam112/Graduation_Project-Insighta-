import 'package:json_annotation/json_annotation.dart';
part 'delete_account_response.g.dart';

@JsonSerializable()
class DeleteAccountResponse {
  String message;

  DeleteAccountResponse({required this.message});

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);
}
