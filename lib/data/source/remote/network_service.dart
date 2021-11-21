import 'package:dio/dio.dart';

import 'network_errors.dart';

class NetworkService {
  static const _httpMethodPost = 'POST';

  static const _data = 'data';
  static const _errors = 'errors';

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
    dynamic data, {
    Map<String, dynamic>? headers,
    required T Function(Map<String, dynamic>) onParse,
  }) async {
    try {
      final options = Options(method: _httpMethodPost);
      if (headers != null) options.headers?.addAll(headers);

      final response = await _dio.request<dynamic>(
        '',
        data: data,
        options: options,
      );

      if (response.data[_errors] != null) {
        return Future.error(NetworkError.create(_createError(response)));
      } else {
        return onParse(response.data[_data] as Map<String, dynamic>);
      }
    } on DioError catch (e) {
      return Future.error(NetworkError.create(e));
    } catch (e) {
      return Future.error(e);
    }
  }

  DioError _createError(Response<dynamic> response) {
    return DioError(
      requestOptions: response.requestOptions,
      response: response,
      error: response.data[_errors],
    );
  }
}
