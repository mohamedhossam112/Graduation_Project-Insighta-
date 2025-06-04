import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_request_body.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_response_body.dart';

class OtpResetPasswordRepo {
  final ApiService _apiService;

  OtpResetPasswordRepo(this._apiService);
  Future<ApiResult<OtpResetPasswordResponseBody>> otpResetPassword(
      OtpResetPasswordRequestBody otpResetPasswordRequestBody) async {
    try {
      final response =
          await _apiService.otpResetPassword(otpResetPasswordRequestBody);
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
