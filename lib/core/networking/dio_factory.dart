import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory{
    static Dio? _authenticatedDio;
      static Dio get authenticatedDio {
    if (_authenticatedDio == null) {
      _authenticatedDio = Dio();
      _authenticatedDio!
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30);
      _authenticatedDio!.interceptors.addAll([
      
        PrettyDioLogger(
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
          requestBody: true,
        ),
     
      ]);
    }
    return _authenticatedDio!;
  }
}