part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class ApplicationSuccesfulLoginEvent extends ApplicationEvent {
  final String token;
  const ApplicationSuccesfulLoginEvent(this.token);
}
