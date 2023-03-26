import 'dart:io';

import 'package:dio/dio.dart';

String? validateError(Object? error) {
  if (error is DioError) {
    error = error.error; // Atribua a exceção original à variável error
  }

  switch (error.runtimeType) {
    case SocketException:
      return "Ocorreu um erro de conexão";
    case HttpException:
      return "Ocorreu um erro de conexão";
    default:
      return null;
  }
}
