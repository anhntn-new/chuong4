import 'dart:convert';

import 'package:chuong4/unit_5/database/secure_storage_helper.dart';
import 'package:chuong4/unit_5/view/logger.dart';
import 'package:dio/dio.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;
    final token = await SecureStorage.instance.getSession();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.sessionId}';
    }
    if (method == 'GET') {
      logger.log(
          "✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}",
          printFullText: true);
    } else {
      try {
        logger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: ${token?.sessionId} \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        logger.log(
            "✈️ REQUEST[$method] => PATH: $uri \n Token: ${token?.sessionId} \n DATA: $data",
            printFullText: true);
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data");
    //Handle section expired
    if (response.statusCode == 401) {
      SecureStorage.instance.removeToken();
      // Get.off(const SignInPage());
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final statusCode = err.response?.statusCode;
    final uri = err.requestOptions.path;
    var data = "";
    try {
      data = jsonEncode(err.response?.data);
    } catch (e, s) {
      logger.e(e, stackTrace: s);
    }
    logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data");
    super.onError(err, handler);
  }
}
