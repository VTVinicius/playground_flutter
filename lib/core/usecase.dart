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
  }) async {
    try {
     await run(params as P).then((value) {
        onSuccess?.call(value);
      });
    } catch (e) {
     await onError?.call(e);
    } finally{
     await onFinally?.call();
    }
  }
}

abstract class NoParamsUseCase<T> extends BaseUseCase<T> {
  const NoParamsUseCase() : super();

  Future<T> run();
}