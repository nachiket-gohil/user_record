import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_record/config/analytics_mixin.dart';

class DioClient {
  final Dio dio;
  final FirebaseAuth auth;

  DioClient(this.dio, this.auth) {
    dio.interceptors.add(LoggingInterceptor(auth));
  }
}

class LoggingInterceptor extends Interceptor with GoogleAnalyticsMixin {
  final FirebaseAuth auth;

  LoggingInterceptor(this.auth);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final user = auth.currentUser;
    final userId = user?.uid ?? 'unknown';

    options.headers['user-id'] = userId;

    final startTime = DateTime.now();

    options.extra['startTime'] = startTime;

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final startTime = response.requestOptions.extra['startTime'] as DateTime?;
    final endTime = DateTime.now();

    if (startTime != null) {
      final duration = endTime.difference(startTime).inMilliseconds;
      gaLogEvent(
        eventName: 'api_call',
        eventValues: {
          'path': response.requestOptions.path,
          'duration': duration,
        },
      );
    }

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final startTime = err.requestOptions.extra['startTime'] as DateTime?;
    final endTime = DateTime.now();

    if (startTime != null) {
      final duration = endTime.difference(startTime).inMilliseconds;
      gaLogEvent(
        eventName: 'api_call_error',
        eventValues: {
          'path': err.requestOptions.path,
          'duration': duration,
          'error': err.message.toString(),
        },
      );
    }

    return super.onError(err, handler);
  }
}
