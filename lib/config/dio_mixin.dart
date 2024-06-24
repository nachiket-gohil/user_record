import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../core/constants/urls.dart';

mixin BaseDio {
  Future<Dio> getBaseDio({required bool requiredToken}) async {
    Map<String, String> headersMap = {};
    headersMap['content-type'] = 'application/json';

    BaseOptions options = BaseOptions(
      baseUrl: Urls.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      responseType: ResponseType.json,
      headers: headersMap,
    );

    Dio dio = Dio(options);

    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseHeader: kDebugMode,
        responseBody: kDebugMode,
        error: kDebugMode,
      ),
    );

    return dio;
  }
}
