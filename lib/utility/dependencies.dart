import 'package:get_it/get_it.dart';
import 'package:ufo_login_app/bloc/bloc/application_bloc.dart';
import 'package:ufo_login_app/utility/authentication.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Authentication>(Authentication());
  getIt.registerSingleton<ApplicationBloc>(ApplicationBloc());
}
