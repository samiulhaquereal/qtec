import 'package:ecommerce/src/app_config/imports/import.dart';

/// Base Failure class
abstract class Failure extends Equatable {
  const Failure({
    this.name = 'An unexpected error occurred',
    this.code,
    this.error,
  });

  final String name; // Error name or default message
  final String? code; // Error code
  final dynamic error;

  @override
  List<Object?> get props => [name, code, error];

  @override
  String toString() {
    return {
      'name': name,
      'code': code,
      'error': error,
    }.toString();
  }
}

/// Client Error Responses
class BadRequest extends Failure {
  const BadRequest(
      dynamic error,
      ) : super(name: 'Bad Request', code: '400', error: error);
}

class Unauthorized extends Failure {
  const Unauthorized(
      dynamic error,
      ) : super(name: 'Unauthorized', code: '401', error: error);
}

class Forbidden extends Failure {
  const Forbidden(
      dynamic error,
      ) : super(name: 'Forbidden', code: '403', error: error);
}

class NotFound extends Failure {
  const NotFound(
      dynamic error,
      ) : super(name: 'Not Found', code: '404', error: error);
}

class MethodNotAllowed extends Failure {
  const MethodNotAllowed(
      dynamic error,
      ) : super(name: 'Method Not Allowed', code: '405', error: error);
}

class NotAcceptable extends Failure {
  const NotAcceptable(
      dynamic error,
      ) : super(name: 'Not Acceptable', code: '406', error: error);
}

class RequestTimeout extends Failure {
  const RequestTimeout(
      dynamic error,
      ) : super(name: 'Request Timeout', code: '408', error: error);
}

class Conflict extends Failure {
  const Conflict(
      dynamic error,
      ) : super(name: 'Conflict', code: '409', error: error);
}

class Gone extends Failure {
  const Gone(
      dynamic error,
      ) : super(name: 'Gone', code: '410', error: error);
}

class LengthRequired extends Failure {
  const LengthRequired(
      dynamic error,
      ) : super(name: 'Length Required', code: '411', error: error);
}

class PreconditionFailed extends Failure {
  const PreconditionFailed(
      dynamic error,
      ) : super(name: 'Precondition Failed', code: '412', error: error);
}

class PayloadTooLarge extends Failure {
  const PayloadTooLarge(
      dynamic error,
      ) : super(name: 'Payload Too Large', code: '413', error: error);
}

class URITooLong extends Failure {
  const URITooLong(
      dynamic error,
      ) : super(name: 'URI Too Long', code: '414', error: error);
}

class UnsupportedMediaType extends Failure {
  const UnsupportedMediaType(
      dynamic error,
      ) : super(name: 'Unsupported Media Type', code: '415', error: error);
}

class RangeNotSatisfiable extends Failure {
  const RangeNotSatisfiable(
      dynamic error,
      ) : super(name: 'Range Not Satisfiable', code: '416', error: error);
}

class ExpectationFailed extends Failure {
  const ExpectationFailed(
      dynamic error,
      ) : super(name: 'Expectation Failed', code: '417', error: error);
}

class UnprocessableEntity extends Failure {
  const UnprocessableEntity(
      dynamic error,
      ) : super(name: 'Unprocessable Entity', code: '422', error: error);
}

class TooManyRequests extends Failure {
  const TooManyRequests(
      dynamic error,
      ) : super(name: 'Too Many Requests', code: '429', error: error);
}

/// Server Error Responses
class InternalServerError extends Failure {
  const InternalServerError(
      dynamic error,
      ) : super(name: 'Internal Server Error', code: '500', error: error);
}

class NotImplemented extends Failure {
  const NotImplemented(
      dynamic error,
      ) : super(name: 'Not Implemented', code: '501', error: error);
}

class BadGateway extends Failure {
  const BadGateway(
      dynamic error,
      ) : super(name: 'Bad Gateway', code: '502', error: error);
}

class ServiceUnavailable extends Failure {
  const ServiceUnavailable(
      dynamic error,
      ) : super(name: 'Service Unavailable', code: '503', error: error);
}

class GatewayTimeout extends Failure {
  const GatewayTimeout(
      dynamic error,
      ) : super(name: 'Gateway Timeout', code: '504', error: error);
}

class Unexpected extends Failure {
  const Unexpected(
      dynamic error,
      ) : super(name: 'Unknown Error', code: '500', error: error);
}

class UnknownError extends Failure {
  const UnknownError (
      dynamic error,
      ) : super(name: 'Unknown Error', code: 'UNKNOWN', error: error);
}

