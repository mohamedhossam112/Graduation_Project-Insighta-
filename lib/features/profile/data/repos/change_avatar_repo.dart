import 'dart:io';

import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/features/profile/data/models/change_avatar_model.dart';
import 'package:insighta/features/profile/data/models/change_avatar_request.dart';

class ChangeAvatarRepo {
  final ApiService _apiService;

  ChangeAvatarRepo(this._apiService);
  Future<ApiResult<AvatarResponse>> changeAvatar( ChangeAvatarRequest changeAvatarRequest) async {
   
    try {
      final formData = await changeAvatarRequest.toFormData();
      final response = await _apiService.changeAvatar(
        formData,
      );
     
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
