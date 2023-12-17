import 'package:chef/constants/constants.dart';

enum ExceptionType {
  network,
  storage,
  unknown,
}

class ExtoException implements Exception {
  ExtoException(
    this._message,
    this._prefix,
  );

  final String _prefix;
  final String _message;

  @override
  String toString() {
    return '$_prefix$_message';
  }
}

//Network Exceptions
class FetchDataException extends ExtoException {
  FetchDataException(String message)
      : super(
          message,
          Api.communicationError,
        );
}

class BadRequestException extends ExtoException {
  BadRequestException(String message)
      : super(
          message,
          Api.invalidRequest,
        );
}

class UnauthorisedException extends ExtoException {
  UnauthorisedException(String message)
      : super(
          message,
          Api.unauthorizedRequest,
        );
}

class InvalidInputException extends ExtoException {
  InvalidInputException(String message)
      : super(
          message,
          Api.requiredField,
        );
}

//Storage Exceptions
class StorageException extends ExtoException {
  StorageException(String message)
      : super(
          message,
          Strings.storageOperationsFailure,
        );
}
