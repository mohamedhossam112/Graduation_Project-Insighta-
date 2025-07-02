import 'dart:io';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_avatar_request.g.dart';

@JsonSerializable()
class ChangeAvatarRequest {
  @JsonKey(fromJson: FileConverter.fromJson, toJson: FileConverter.toJson)
  final File? profileImageUrl;

  ChangeAvatarRequest({
    this.profileImageUrl,
  });

  factory ChangeAvatarRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeAvatarRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeAvatarRequestToJson(this);

  Future<FormData> toFormData() async {
    final formData = FormData();

    if (profileImageUrl != null && await profileImageUrl!.exists()) {
      formData.files.add(
        MapEntry(
          'ProfileImageUrl',
          await MultipartFile.fromFile(
            profileImageUrl!.path,
            filename: profileImageUrl!.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }

    return formData;
  }
}

class FileConverter {
  static File? fromJson(String? path) {
    if (path == null) return null;
    return File(path);
  }

  static String? toJson(File? file) {
    if (file == null) return null;
    return file.path;
  }
}