import 'package:insighta/core/networking/api_error_handler.dart';
import 'package:insighta/core/networking/api_result.dart';
import 'package:insighta/core/networking/api_service.dart';

import 'package:insighta/features/profile/data/models/delete_account_request.dart';
import 'package:insighta/features/profile/data/models/delete_account_response.dart';

class DeleteAccountRepo {
  final ApiService _apiService;

  DeleteAccountRepo(this._apiService);
  Future<ApiResult<DeleteAccountResponse>> deleteAccount(
      DeleteAccountRequest deleteAccountRequest) async {
    try {
      final response = await _apiService.deleteProfile(deleteAccountRequest);
      return ApiResult.success(response);
    } catch (errMessage) {
      return ApiResult.failure(ApiErrorHandler.handle(errMessage));
    }
  }
}
