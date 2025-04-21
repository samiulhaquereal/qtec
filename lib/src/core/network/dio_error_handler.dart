import 'package:ecommerce/src/app_config/imports/import.dart';

class ApiErrorHandler {

  dynamic handleException(dynamic error) {
    final dynamic errorData = error.response?.data;

    if (errorData == null) {
      if (error is DioException &&
          (error.type == DioExceptionType.connectionTimeout ||
              error.type == DioExceptionType.sendTimeout)) {
        ErrorCatcher.setError(
          exception: error,
          stackTrace: StackTrace.current,
          hasError: true,
          statusCode: 408,
        );
        throw RequestTimeout(errorData);
      } else {
        throw Unexpected(errorData);
      }
    }

    ErrorCatcher.setError(
      exception: error,
      stackTrace: StackTrace.current,
      hasError: true,
      statusCode: error.response?.statusCode as int?,
    );

    if (kDebugMode) {
      print('ErrorCatch: ${ErrorCatcher().toJson()}');
      print('ErrorCatch: ${ErrorCatcher().hasError}');
    }

    switch (error.response?.statusCode) {
      case 400:
        throw BadRequest(errorData);
      case 401:
        throw Unauthorized(errorData);
      case 403:
        throw Forbidden(errorData);
      case 404:
        throw NotFound(errorData);
      case 405:
        throw MethodNotAllowed(errorData);
      case 406:
        throw NotAcceptable(errorData);
      case 408:
        throw RequestTimeout(errorData);
      case 409:
        throw Conflict(errorData);
      case 410:
        throw Gone(errorData);
      case 411:
        throw LengthRequired(errorData);
      case 412:
        throw PreconditionFailed(errorData);
      case 413:
        throw PayloadTooLarge(errorData);
      case 414:
        throw URITooLong(errorData);
      case 415:
        throw UnsupportedMediaType(errorData);
      case 416:
        throw RangeNotSatisfiable(errorData);
      case 417:
        throw ExpectationFailed(errorData);
      case 422:
        throw UnprocessableEntity(errorData);
      case 429:
        throw TooManyRequests(errorData);
      case 500:
        throw InternalServerError(errorData);
      case 501:
        throw NotImplemented(errorData);
      case 502:
        throw BadGateway(errorData);
      case 503:
        throw ServiceUnavailable(errorData);
      case 504:
        throw GatewayTimeout(errorData);
      default:
        throw Unexpected(errorData);
    }
  }
}

class ErrorCatcher {
  factory ErrorCatcher() {
    return _instance;
  }
  ErrorCatcher._privateConstructor();
  static final ErrorCatcher _instance = ErrorCatcher._privateConstructor();

  bool? hasError;
  int? statusCode;
  Exception? exception;
  StackTrace? stackTrace;

  factory ErrorCatcher.setError({
    required bool hasError,
    required statusCode,
    Exception? exception,
    StackTrace? stackTrace,
  }) {
    return ErrorCatcher()
      ..exception = exception
      ..stackTrace = stackTrace
      ..hasError = hasError
      ..statusCode = statusCode;
  }

  Map<String, dynamic> toJson() => {
    'exception': exception,
    'stackTrace': stackTrace,
    'hasError': hasError,
    'statusCode': statusCode,
  };
}



