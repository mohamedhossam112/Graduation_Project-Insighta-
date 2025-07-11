import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/core/networking/books_api_service.dart';
import 'package:insighta/core/networking/dio_factory.dart';
import 'package:insighta/features/auth/forget_password/data/repos/forget_password_repo.dart';
import 'package:insighta/features/auth/forget_password/logic/forget_password_cubit/forget_password_cubit.dart';
import 'package:insighta/features/auth/login/data/repos/login_repo.dart';
import 'package:insighta/features/auth/login/logic/facebook_login_cubit/facebook_login_cubit.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_cubit.dart';
import 'package:insighta/features/auth/otp/data/repos/otp_reset_password_repo.dart';
import 'package:insighta/features/auth/otp/logic/otp_reset_pass_cubit/otp_reset_pass_cubit.dart';
import 'package:insighta/features/auth/reset_password/data/repos/reset_password_repo.dart';
import 'package:insighta/features/auth/reset_password/logic/reset_password_cubit/reset_password_cubit.dart';
import 'package:insighta/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:insighta/features/auth/sign_up/logic/signup_cubit/signup_cubit.dart';
import 'package:insighta/features/profile/data/repos/change_avatar_repo.dart';
import 'package:insighta/features/profile/data/repos/delete_account_repo.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_cubit.dart';
import 'package:insighta/features/profile/logic/delete_account_cubit/delete_account_cubit.dart';
import 'package:insighta/features/suggest/data/repos/get_books_repo.dart';
import 'package:insighta/features/suggest/logic/get_books_cubit/get_books_cubit.dart';

import 'package:insighta/features/therapy/data/repos/therapy_repo.dart';
import 'package:insighta/features/therapy/logic/get_therapist_cubit/get_therapist_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Dio & BooksService
  Dio booksDio = await DioFactory.getBooksDio();
  // Dio booksDio = Dio(BaseOptions(baseUrl: 'https://www.googleapis.com/books/v1/'));
  getIt.registerLazySingleton<BooksApiService>(() => BooksApiService(booksDio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //Signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  //forgetPassword
  getIt.registerLazySingleton<ForgetPasswordRepo>(
      () => ForgetPasswordRepo(getIt()));
  getIt
      .registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(getIt()));
  //otp
  getIt.registerLazySingleton<OtpResetPasswordRepo>(
      () => OtpResetPasswordRepo(getIt()));
  getIt.registerFactory<OtpResetPassCubit>(() => OtpResetPassCubit(getIt()));
  //resetPassword
  getIt.registerLazySingleton<ResetPasswordRepo>(
      () => ResetPasswordRepo(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  //therapy
  getIt.registerLazySingleton<TherapyRepo>(() => TherapyRepo(getIt()));
  getIt.registerFactory<GetTherapistCubit>(() => GetTherapistCubit(getIt()));
  //changeAvatar
  getIt
      .registerLazySingleton<ChangeAvatarRepo>(() => ChangeAvatarRepo(getIt()));
  getIt.registerFactory<ChangeAvatarCubit>(() => ChangeAvatarCubit(getIt()));
  //deleteAccount
  getIt.registerLazySingleton<DeleteAccountRepo>(
      () => DeleteAccountRepo(getIt()));
  getIt.registerFactory<DeleteAccountCubit>(() => DeleteAccountCubit(getIt()));
  //getBooksSuggest
  getIt.registerLazySingleton<GetBooksRepo>(() => GetBooksRepo(getIt()));
  getIt.registerFactory<GetBooksCubit>(() => GetBooksCubit(getIt()));
  // facebook login (no repo for now)
  getIt.registerFactory<FacebookLoginCubit>(() => FacebookLoginCubit());
}
