

import 'package:dio/dio.dart';
import 'package:insighta/core/networking/api_constants.dart';
import 'package:insighta/features/auth/forget_password/data/models/forget_password_request_body.dart';
import 'package:insighta/features/auth/forget_password/data/models/forget_password_response_body.dart';
import 'package:insighta/features/auth/login/data/models/login_request_body.dart';
import 'package:insighta/features/auth/login/data/models/login_response_body.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_request_body.dart';
import 'package:insighta/features/auth/otp/data/models/otp_reset_password_response_body.dart';
import 'package:insighta/features/auth/reset_password/data/models/reset_password_request_body.dart';
import 'package:insighta/features/auth/reset_password/data/models/reset_password_response_body.dart';
import 'package:insighta/features/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:insighta/features/auth/sign_up/data/models/sign_up_response_body.dart';
import 'package:insighta/features/profile/data/models/change_avatar_model.dart';

import 'package:insighta/features/therapy/data/models/therapy_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );
  @POST(ApiConstants.signup)
  Future<SignupResponseBody> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseBody> forgetPassword(
    @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
  );
  @POST(ApiConstants.otpVerify)
  Future<OtpResetPasswordResponseBody> otpResetPassword(
    @Body() OtpResetPasswordRequestBody otpResetPasswordRequestBody,
  );
  @POST(ApiConstants.resetPassword)
  Future<ResetPasswordResponseBody> resetPassword(
    @Body() ResetPasswordRequestBody resetPasswordRequestBody,
  );
  @GET(ApiConstants.therapy)
  Future<TherapyResponse> getTherapist();
  @POST(ApiConstants.changeAvatar)
  @MultiPart()
  Future<AvatarResponse> changeAvatar(
 //   @Part(name: 'avatar') MultipartFile avatar,
     @Body() FormData formData,
   
  );
}
