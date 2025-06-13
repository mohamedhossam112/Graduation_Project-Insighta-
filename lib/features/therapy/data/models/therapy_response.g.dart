// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapy_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapyResponse _$TherapyResponseFromJson(Map<String, dynamic> json) =>
    TherapyResponse(
      code: json['code'] as String,
      message: json['message'] as String?,
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      payload: (json['payload'] as List<dynamic>?)
          ?.map((e) => Payload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TherapyResponseToJson(TherapyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'pagination': instance.pagination,
      'payload': instance.payload,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      page: (json['page'] as num).toInt(),
      nextPage: (json['next_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      resultCount: (json['result_count'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'next_page': instance.nextPage,
      'last_page': instance.lastPage,
      'result_count': instance.resultCount,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      specialty: json['specialty'] as String?,
      rating: json['rating'] as String?,
      price: json['price'] as String?,
      file: json['file'] == null
          ? null
          : File.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'specialty': instance.specialty,
      'rating': instance.rating,
      'price': instance.price,
      'file': instance.file,
    };

File _$FileFromJson(Map<String, dynamic> json) => File(
      id: (json['id'] as num).toInt(),
      url: json['url'] as String?,
      name: json['name'] as String?,
      mimeType: json['mime_type'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'mime_type': instance.mimeType,
      'type': instance.type,
    };
