import 'dart:io';

import 'package:dio/dio.dart';
import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/features/profile/data/models/change_avatar_model.dart';

class ChangeAvatarRepo {
  final ApiService _apiService;

  ChangeAvatarRepo(this._apiService);
  Future<ApiResult<AvatarResponse>> changeAvatar(File imageFile) async {
    try {
      final multipartFile = await MultipartFile.fromFile(
        imageFile.path,
        filename: imageFile.path.split("/").last,
      );
      final response = await _apiService.changeAvatar(multipartFile);
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
