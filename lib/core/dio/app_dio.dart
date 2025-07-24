import 'package:baseApp/core/dio/intercepter.dart';
import 'package:baseApp/features/home/data/datasources/user_data_source.dart';
import 'package:baseApp/main.dart';
import 'package:baseApp/routers/app_router.dart';
import 'package:dio/dio.dart';
import 'package:dio_curl_logger/dio_curl_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:alice/alice.dart';

@module
abstract class AppNetworkModule {
  static bool _shouldEnableAlice() {
    return appFlavor != BuildFlavor.production;
  }

  @singleton
  Alice provideAlice() => Alice(
        showInspectorOnShake: true,
        showNotification: true,
        navigatorKey: AppRouteName.navigatorKey,
      );

  @singleton
  Dio provideDio(Alice alice) {
    Dio dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
      },
    ));

    dio.interceptors.add(RequestInterceptor());

    // Thêm Alice interceptor
    if (_shouldEnableAlice()) {
      dio.interceptors.add(alice.getDioInterceptor());
    }

    dio.interceptors.add(
      CurlLoggingInterceptor(
        showRequestLog: true,
        showResponseLog: false,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    return dio;
  }

  @singleton
  UserDataSource getUserDataSource(Dio dio, String baseUrl) =>
      UserDataSource(dio, baseUrl: baseUrl);
}
