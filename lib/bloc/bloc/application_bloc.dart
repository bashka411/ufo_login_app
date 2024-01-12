import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(const ApplicationState.unauthenticated()) {
    on<ApplicationSuccesfulLoginEvent>(_onSuccesfulLoginEvent);
  }

  FutureOr<void> _onSuccesfulLoginEvent(ApplicationSuccesfulLoginEvent event, Emitter<ApplicationState> emit) {
    emit(ApplicationState.authenticated(event.token));
  }
}
