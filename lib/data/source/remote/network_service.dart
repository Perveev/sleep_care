import 'package:dio/dio.dart';

import 'network_errors.dart';

class NetworkService {
  late Dio _dio;

  NetworkService(
    String baseUrl, {
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    Map<String, dynamic>? headers,
    List<Interceptor>? interceptors,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
    );

    if (interceptors != null) _dio.interceptors.addAll(interceptors);
  }

  Future<T> request<T>(
    String path,
    HttpMethod method, {
    dynamic data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    required T Function(Response<dynamic>) onParse,
  }) async {
    try {
      final options = Options(method: method.name,headers: headers);
      if (headers != null) options.headers?.addAll(headers);
      final response = await _dio.request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return onParse(response);
    } on DioError catch (e) {
      return Future.error(NetworkError.create(e));
    } catch (e) {
      return Future.error(e);
    }
  }
}

enum HttpMethod { get, put, post, delete }

extension _HttpMethodExtension on HttpMethod {
  String get name {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.delete:
        return 'DELETE';
      default:
        throw "Http method '$name' isn't defined.";
    }
  }
}
