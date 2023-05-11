import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:we_link/core/constants/key_constants.dart';
import 'package:we_link/di/app_module.dart';

class BaseApi extends GetConnect {
  var accessToken = appStorage.read(KEY_ACCESS_TOKEN) ?? '';
  var refreshToken = appStorage.read(KEY_REFRESH_TOKEN) ?? '';
  var xApiKey = dotenv.env[X_API_KEY].toString();
  var userDetail = appStorage.read(KEY_USER_DETAIL) ?? '';

  static String contentType = "application/json";

  @override
  void onInit() {
    httpClient.baseUrl = dotenv.env[KEY_BASE_URL_V1].toString();

    httpClient.addRequestModifier((Request request) {
      request.headers['X-Api-Key'] = xApiKey;
      // request.headers['X-Token'] = token;
      // request.headers['Content-Type'] = contentType;
      return request;
    });

    // httpClient.addAuthenticator((request) async {
    //   final response = await get("http://yourapi/token");
    //   final token = response.body['token'];
    //   // Set the header
    //   request.headers['Authorization'] = "$token";
    //   return request;
    // });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    // httpClient.maxAuthRetries = 3;
  }
}
