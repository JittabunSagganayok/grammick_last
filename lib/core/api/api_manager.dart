import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../di/app_module.dart';
import '../constants/key_constants.dart';

const DEFAULT_CONNECTION_TIMEOUT = Duration(seconds: 30);
const DEFAULT_RECEIVE_TIMEOUT = Duration(seconds: 30);

class ApiManager {
  Dio initial() {
    var options = BaseOptions(
      baseUrl: dotenv.env[KEY_BASE_URL].toString(),
      connectTimeout: DEFAULT_CONNECTION_TIMEOUT,
      receiveTimeout: DEFAULT_RECEIVE_TIMEOUT,
    );

    final dio = Dio(options)
      ..interceptors.add(AppLogging())
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}

class AppLogging extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var accessToken = appStorage.read(KEY_ACCESS_TOKEN) ?? '';
    var refreshToken = appStorage.read(KEY_REFRESH_TOKEN) ?? '';
    var xApiKey = dotenv.env[X_API_KEY].toString();

    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer ${accessToken}';
    }

    if (refreshToken.isNotEmpty) {
      options.headers['RefreshToken'] = refreshToken;
    }

    if (xApiKey.isNotEmpty) {
      options.headers['X-Api-Key'] = xApiKey;
    }

    if (options.path.contains('admin/') || options.path.contains('/status') || options.path.contains('notifications')) {
      options.baseUrl = dotenv.env[KEY_BASE_URL].toString().replaceAll('customer/', '');
    } else if (options.path.contains('restaurant/') || options.path.contains('booking/')) {
      options.baseUrl = '${dotenv.env[KEY_BASE_URL_V1]}/customer/';
    } else {
      options.baseUrl = dotenv.env[KEY_BASE_URL].toString();
    }

    super.onRequest(options, handler);
  }
}
