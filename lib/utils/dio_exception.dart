import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_example/utils/error_request.dart';

class DioClientException {
  late String error;

  DioClientException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        error = 'Se ha agotado el tiempo de conexión.';
        break;
      case DioExceptionType.badResponse:
        error = _errorStatusCode(dioError.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        if (dioError.error is SocketException) {
          error = 'No tienes conexión a internet.';
          break;
        }
        error = 'Algo salio mal';
        break;
      default:
        error = 'Algo salio mal';
        break;
    }
  }

  String _errorStatusCode(int? statusCode) {
    switch (statusCode) {
      case 404:
        return 'Elemento no encontrado.';
      case 500:
        return 'Internal server error';
      default:
        return 'Algo salio mal';
    }
  }
}
