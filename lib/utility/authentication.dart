import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ufo_login_app/bloc/bloc/application_bloc.dart';
import 'package:ufo_login_app/utility/dependencies.dart';

class Authentication {
  Future<void> login({required String username, required String password}) async {
    const String apiUrl = 'http://api.stage.newcrm.projects.od.ua/api/auth/login';
    final applicationBloc = getIt<ApplicationBloc>();

    final Map<String, String> requestData = {
      'user_name': username,
      'pass_word': password,
    };

    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(requestData),
    );

    final output = json.decode(response.body) as Map<String, dynamic>;
    
    if (response.statusCode == 200) {
      print('Login successful. Response: ${response.body}');
      final token = output['access_token'];
      applicationBloc.add(ApplicationSuccesfulLoginEvent(token));
    } else {
      final error = output['error'];
      throw error;
    }
  }
}
