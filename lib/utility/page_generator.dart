import 'package:flutter/material.dart';
import 'package:ufo_login_app/bloc/bloc/application_bloc.dart';
import 'package:ufo_login_app/screens/home/home_screen.dart';
import 'package:ufo_login_app/screens/login/login_screen.dart';

List<Page> onGenerateAppViewPages(
  AuthStatus status,
  List<Page<dynamic>> pages,
) {
  switch (status) {
    case AuthStatus.authenticated:
      return [HomeScreen.page()];
    case AuthStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
