import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_example/utils/dio_exception.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
      connectTimeout: const Duration(seconds: 3),
    ),
  )..interceptors.addAll(
      [
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            if (options.path != '/login' && options.path != '/register') {
              const token = 'El token viene aqui';
              options.headers.addAll({'Authorization': 'Bearer $token'});
            }
            handler.next(options);
          },
        ),
        if (kDebugMode)
          LogInterceptor(
            request: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: false,
          ),
      ],
    );

  bool _isSuccess(int? code) {
    return code != null && code >= 200 && code <= 299;
  }

  Future<Map<String, dynamic>> get({
    required String path,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(
        path,
        options: options,
        queryParameters: queryParams,
      );

      if (_isSuccess(response.statusCode)) {
        return response.data;
      }
      throw 'Error get $path';
    } on DioException catch (dioError) {
      final ex = DioClientException(dioError);
      throw ex.error;
    }
  }

  Future<Map<String, dynamic>> post({
    required String path,
    required Map<String, dynamic> body,
    Options? options,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        options: options,
        queryParameters: queryParams,
      );

      if (_isSuccess(response.statusCode)) {
        return response.data;
      }
      throw 'Error post $path';
    } on DioException catch (dioError) {
      final ex = DioClientException(dioError);
      throw ex.error;
    }
  }
}
