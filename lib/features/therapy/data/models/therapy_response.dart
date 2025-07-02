import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insighta/features/therapy/data/models/therapy_response.dart';

part 'therapy_response.g.dart';

@JsonSerializable()
class TherapyResponse {
  String code;
  String? message;
  Pagination? pagination;
  List<Payload>? payload;

  TherapyResponse(
      {required this.code,
      required this.message,
      required this.pagination,
      required this.payload});

  factory TherapyResponse.fromJson(Map<String, dynamic> json) =>
      _$TherapyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyResponseToJson(this);
}

@JsonSerializable()
class Pagination {
  int page;
  @JsonKey(name: 'next_page')
  int nextPage;
  @JsonKey(name: 'last_page')
  int lastPage;
  @JsonKey(name: 'result_count')
  int resultCount;

  Pagination(
      {required this.page,
      required this.nextPage,
      required this.lastPage,
      required this.resultCount});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Payload {
  String id;
  String? name;
  String? email;
  String? phone;
  String? specialty;
  String? rating;
  String? price;
  @JsonKey(name: 'file')
TherapyFile? therapyFile;

  Payload(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.specialty,
      required this.rating,
      required this.price,
      required this.therapyFile});

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

@JsonSerializable()
class TherapyFile {
  int id;
  String? url;
  String? name;
  @JsonKey(name: 'mime_type')
  String? mimeType;
  String? type;

  TherapyFile(
      {required this.id,
      required this.url,
      required this.name,
      required this.mimeType,
      required this.type});

  factory TherapyFile.fromJson(Map<String, dynamic> json) =>
      _$TherapyFileFromJson(json);

  Map<String, dynamic> toJson() => _$TherapyFileToJson(this);
}
