
import 'package:json_annotation/json_annotation.dart';
part 'delete_account_request.g.dart';
@JsonSerializable()
class DeleteAccountRequest {
    String password;

  DeleteAccountRequest({required this.password});

  Map<String, dynamic> toJson()=> _$DeleteAccountRequestToJson(this);
}