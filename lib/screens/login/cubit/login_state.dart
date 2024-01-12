part of 'login_cubit.dart';

enum LogInStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String username;
  final String password;
  final LogInStatus status;
  final String? errorMessage;

  const LoginState({
    required this.username,
    required this.password,
    required this.status,
    this.errorMessage
  });

  factory LoginState.initial() {
    return const LoginState(
      username: '',
      password: '',
      status: LogInStatus.initial,
    );
  }

  LoginState copyWith({
    String? username,
    String? password,
    LogInStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? errorMessage,
    );
  }

  @override
  List<Object> get props => [username, password, status];
}
