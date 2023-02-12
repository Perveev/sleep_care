import 'dart:io';

import 'package:dio/dio.dart';

class NetworkError extends Error {
  final String? baseUrl;
  final String? path;
  final String? message;
  final dynamic responseData;
  final int? statusCode;
  final Headers? responseHeaders;

  NetworkError({
    this.baseUrl,
    this.path,
    this.message,
    this.responseData,
    this.statusCode,
    this.responseHeaders,
  });

  factory NetworkError.create(DioError error) {
    if (error.error is SocketException) {
      return ConnectionError();
    } else if (error.response?.statusCode == HttpStatus.unauthorized) {
      return UnauthorizedError();
    } else {
      final response = error.response;
      final request = error.requestOptions;
      return NetworkError(
        statusCode: response?.statusCode,
        responseHeaders: response?.headers,
        responseData: response?.data,
        baseUrl: request.baseUrl,
        path: request.path,
        message: error.message,
      );
    }
  }

  @override
  String toString() {
    return 'NetworkError{baseUrl: $baseUrl, path: $path, message: $message, responseData: $responseData, statusCode: $statusCode, responseHeaders: $responseHeaders}';
  }
}

class ConnectionError extends NetworkError {}

class UnauthorizedError extends NetworkError {}
