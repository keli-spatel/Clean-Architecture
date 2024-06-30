import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;
  final int statusCode;

  const ServerException({
    required this.message,
    required this.statusCode,
  });
  @override
  List<Object?> get props => [
        message,
        statusCode,
      ];
}

class ApiException extends ServerException implements Exception {
  const ApiException({
    required super.message,
    required super.statusCode,
  });
}

class CacheException extends ServerException implements Exception {
  const CacheException({
    required super.message,
    required super.statusCode,
  });
}

class UnHandleException extends ServerException implements Exception {
  const UnHandleException({
    required super.message,
    required super.statusCode,
  });
}

class ServerException401 extends ServerException implements Exception {
  const ServerException401({
    required super.message,
    required super.statusCode,
  });
}

class ServerException400 extends ServerException implements Exception {
  const ServerException400({
    required super.message,
    required super.statusCode,
  });
}

class ServerException500 extends ServerException implements Exception {
  const ServerException500({
    required super.message,
    required super.statusCode,
  });
}
