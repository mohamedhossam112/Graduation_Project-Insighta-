import 'package:dio/dio.dart';
import 'package:insighta/core/networking/api_constants.dart';
import 'package:insighta/features/auth/login/data/models/login_request_body.dart';
import 'package:insighta/features/auth/login/data/models/login_response_body.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
