import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;
  final int? statusCode;
  const Failure(this.errorMessage, [this.statusCode]);
  @override
  List<Object> get props => [errorMessage!, statusCode!];
}

class ServerFailure extends Failure {
  final int? errorCode;
  const ServerFailure(String errorMessage, this.errorCode)
    : super(errorMessage, errorCode);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String super.errorMessage);
}

class CredentialFailure extends Failure {
  const CredentialFailure(String super.errorMessage);
}
