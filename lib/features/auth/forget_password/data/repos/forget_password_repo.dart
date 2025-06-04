import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/features/auth/forget_password/data/models/forget_password_request_body.dart';
import 'package:insighta/features/auth/forget_password/data/models/forget_password_response_body.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);
  Future<ApiResult<ForgetPasswordResponseBody>> forgetPassword(
      ForgetPasswordRequestBody ForgetPasswordRequestBody) async {
    try {
      final response =
          await _apiService.forgetPassword(ForgetPasswordRequestBody);
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
