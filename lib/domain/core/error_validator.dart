import 'dart:io';

String? validateError(Object? error) {

  switch (error.runtimeType) {
    case SocketException:
      return "Ocorreu um erro de conexão";
    case HttpException:
      return "Ocorreu um erro de conexão";
    default:
      return null;
  }
}
