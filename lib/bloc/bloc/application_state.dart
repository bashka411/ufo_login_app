part of 'application_bloc.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class ApplicationState extends Equatable {
  final AuthStatus status;
  final String? token = null;

  const ApplicationState._({required this.status, token});

  const ApplicationState.authenticated(String token) : this._(status: AuthStatus.authenticated, token: token);
  const ApplicationState.unauthenticated() : this._(status: AuthStatus.unauthenticated);

  @override
  List<Object> get props => [status];
}
