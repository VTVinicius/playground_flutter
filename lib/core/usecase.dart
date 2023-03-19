abstract class BaseUseCase<T> {
  const BaseUseCase();
}

abstract class UseCase<T, P> extends BaseUseCase<T> {
  const UseCase() : super();

  Future<T> run(P params);

  void invoke({
    P? params,
    Function(Object?)? onError,
    Function(T)? onSuccess,
    Function()? onFinally,
  }) {
    try {
      run(params as P).then((value) {
        onSuccess?.call(value);
      });
    } catch (e) {
      onError?.call(e);
    } finally{
      onFinally?.call();
    }
  }
}

abstract class NoParamsUseCase<T> extends BaseUseCase<T> {
  const NoParamsUseCase() : super();

  Future<T> run();
}