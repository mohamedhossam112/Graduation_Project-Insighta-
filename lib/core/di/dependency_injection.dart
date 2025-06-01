import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:insighta/core/networking/api_service.dart';
import 'package:insighta/core/networking/dio_factory.dart';
import 'package:insighta/features/auth/login/data/repos/login_repo.dart';
import 'package:insighta/features/auth/login/logic/login_cubit/login_cubit.dart';

final getTt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getTt.registerLazySingleton<ApiService>(() => ApiService(dio));
  // Login
  getTt.registerLazySingleton<LoginRepo>(() => LoginRepo(getTt()));
  getTt.registerLazySingleton<LoginCubit>(() => LoginCubit(getTt()));
}
