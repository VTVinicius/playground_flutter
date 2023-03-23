class DomainException implements Exception {
  final String message;
  final String? title;

  DomainException(this.message, [this.title]);

  @override
  String toString() {
    return "DomainException: $message ${title ?? ''}";
  }
}

abstract class ParamException extends DomainException {
  ParamException(String message, [String? title]) : super(message, title);
}

class MissingParamsException extends ParamException {
  MissingParamsException() : super("Params must not be null");
}

class EmptyFieldException extends ParamException {
  EmptyFieldException() : super("Campo obrigatório");
}
