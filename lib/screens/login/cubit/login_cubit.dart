import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ufo_login_app/utility/authentication.dart';
import 'package:ufo_login_app/utility/dependencies.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _authentication = getIt<Authentication>();

  LoginCubit() : super(LoginState.initial());

  void usernameChanged(String value) {
    emit(
      state.copyWith(username: value, status: LogInStatus.initial),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(password: value, status: LogInStatus.initial),
    );
  }

  Future<void> login() async {
    if (state.status == LogInStatus.submitting) return;
    emit(state.copyWith(status: LogInStatus.submitting));
    try {
      await _authentication.login(username: state.username, password: state.password);
      emit(state.copyWith(status: LogInStatus.success));
    } catch (err) {
      emit(state.copyWith(status: LogInStatus.error, errorMessage: err.toString()));
    }
  }
}
