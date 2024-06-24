// 📦 Package imports:
import 'package:dio/dio.dart';

abstract class HttpError {
  HttpError({
    this.message,
    this.errorCode,
    this.errorType,
  });

  final String? message;
  final int? errorCode;
  final DioErrorType? errorType;

  HttpError appErrorType(errorType, message) {
    switch (errorType) {
      case DioErrorType.connectionTimeout:
        return SlowInternetError();

      case DioErrorType.receiveTimeout:
        return SlowInternetError();

      case DioErrorType.sendTimeout:
        return SlowInternetError();

      case DioErrorType.cancel:
        return CancelError();

      default:
        if (errorCode == 401) {
          return UnAuthorizedError();
        } else {
          return AppError(
            errorCode: errorCode,
            message: message,
          );
        }
    }
  }
}

class AppError extends HttpError {
  AppError({
    String? message,
    int? errorCode,
    DioErrorType? error,
  }) : super(
          message: message,
          errorCode: errorCode,
          errorType: error,
        );
}

class NoInternetError extends HttpError {
  NoInternetError({
    String? message,
    int? errorCode,
    DioErrorType? error,
  }) : super(
          message: message,
          errorCode: errorCode,
          errorType: error,
        );
}

class SlowInternetError extends HttpError {
  SlowInternetError({
    String? message,
    int? errorCode,
    DioErrorType? error,
  }) : super(
          message: message,
          errorCode: errorCode,
          errorType: error,
        );
}

class CancelError extends HttpError {
  CancelError({
    String? message,
    int? errorCode,
    DioErrorType? error,
  }) : super(
          message: message,
          errorCode: errorCode,
          errorType: error,
        );
}

class UnAuthorizedError extends HttpError {
  UnAuthorizedError({
    String? message,
    int? errorCode,
    DioErrorType? error,
  }) : super(
          message: message,
          errorCode: errorCode,
          errorType: error,
        );
}
