class ViewState<T> {
  final Status status;
  final T? data;
  final Object? error;

  ViewState({this.status = Status.neutral, this.data, this.error});

  void stateHandler({
    Function(T)? onSuccess,
    Function(Object)? onError,
    Function()? onLoading,
  }) {
    onSuccess ??= (T _) {};
    onError ??= (Object _) {};
    onLoading ??= () {};

    switch (status) {
      case Status.success:
        if (data != null) {
          onSuccess(data!);
        } else {
          throw Exception('Data is null');
        }
        break;
      case Status.error:
        if (error != null) {
          onError(error!);
        } else {
          throw Exception('Error is null');
        }
        break;
      case Status.loading:
        onLoading();
        break;
      default:
        break;
    }
  }
}

enum Status { success, error, loading, neutral }

extension ViewStateExtension on ViewState? {
  bool isSuccess() => this?.status == Status.success;

  bool isError() => this?.status == Status.error;

  bool isLoading() => this?.status == Status.loading;
}
