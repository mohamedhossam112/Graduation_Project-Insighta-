import 'package:freezed_annotation/freezed_annotation.dart';
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
  File? file;

  Payload(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.specialty,
      required this.rating,
      required this.price,
      required this.file});

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

@JsonSerializable()
class File {
  int id;
  String? url;
  String? name;
  @JsonKey(name: 'mime_type')
  String? mimeType;
  String? type;

  File(
      {required this.id,
      required this.url,
      required this.name,
      required this.mimeType,
      required this.type});

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);
}
