import 'package:freezed_annotation/freezed_annotation.dart';
part 'linked_account_model.g.dart';

@JsonSerializable()
class LinkedAccountModel {
  final String id;
  final String name;
  final String username;
  final String? avatarImage;

  const LinkedAccountModel({
    required this.id,
    required this.name,
    required this.username,
    this.avatarImage,
  });

  factory LinkedAccountModel.fromJson(Map<String, dynamic> json) =>
      _$LinkedAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinkedAccountModelToJson(this);
}
