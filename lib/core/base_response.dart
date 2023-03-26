import 'package:flutter/cupertino.dart';

abstract class BaseResponse<T> {}

class Loading<T> extends BaseResponse<T> {}

class Waiting<T> extends BaseResponse<T> {}

class Error<T> extends BaseResponse<T> {
  final Object? error;

  Error({required this.error});
}

class Success<T> extends BaseResponse<T> {
  final T value;

  Success({required this.value});
}

extension MutableStateFlowNullableExtensions<T> on ValueNotifier<T?> {
  void updateState(T Function(T) reducer) {
    if (value != null) {
      value = reducer(value!);
    }
  }
}

extension AsyncExtensions<T> on BaseResponse<T> {
  BaseResponse<T> updateSuccessState(T Function(T) reducer) {
    return this is Success<T>
        ? Success(value: reducer((this as Success<T>).value))
        : this;
  }

  T? asSuccessOrNull() =>
      this is Success<T> ? (this as Success<T>).value : null;
}

extension ErrorExtensions<T> on BaseResponse<T> {
  Object? getErrorOrNull() =>
      this is Error<T> ? (this as Error<T>).error : null;
}
