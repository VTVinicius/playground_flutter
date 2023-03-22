import 'dart:io';

bool isCommonError(Object? error) {
  return error is SocketException || error is HttpException;
}

Object? validateStateError(Object? error) {
  if (isCommonError(error)) {
    return error;
  } else {
    return null;
  }
}
