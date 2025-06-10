import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/features/auth/reset_password/data/models/reset_password_request_body.dart';
import 'package:insighta/features/auth/reset_password/data/models/reset_password_response_body.dart';


class ResetPasswordRepo {
  final ApiService _apiService;

  ResetPasswordRepo(this._apiService);
  Future<ApiResult<ResetPasswordResponseBody>> resetPassword(
      ResetPasswordRequestBody resetPasswordRequestBody) async {
    try {
      final response = await _apiService.resetPassword(resetPasswordRequestBody);
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
