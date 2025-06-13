import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/features/therapy/data/models/therapy_response.dart';

class TherapyRepo {
  final ApiService _apiService;

  TherapyRepo(this._apiService);

  Future<ApiResult<TherapyResponse>> getTherapist() async {
    try {
      final response = await _apiService.getTherapist();
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
