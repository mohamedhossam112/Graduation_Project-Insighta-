import 'package:dio/dio.dart';
import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      await _addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static Future<void> _addDioHeaders() async {
    final token =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
    print("_addDioHeaders token: $token");
    dio?.options.headers = {
      'Accept': 'application/json',
      if (token.isNotEmpty) 'Authorization': "Bearer $token",
    };
  }

  static void addDioInterceptor() {
    dio!.interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          requestBody: true,
        ),
        InterceptorsWrapper(
          onResponse: (response, handler) async {
            final token = response.data["token"];
            if (token != null) {
              await SharedPrefHelper.setSecuredString(
                  SharedPrefKeys.userToken, token);
              // dio?.options.headers['Authorization'] = token;
              dio?.options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(response);
          },
        ),
      ],
    );
  }
}
