import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ufo_login_app/bloc/bloc/application_bloc.dart';
import 'package:ufo_login_app/utility/dependencies.dart' as get_it;
import 'package:ufo_login_app/utility/dependencies.dart';
import 'package:ufo_login_app/utility/page_generator.dart';

void main() {
  get_it.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ApplicationBloc>(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'UFO Login App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(1, 69, 157, 229)),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: FlowBuilder<AuthStatus>(
            state: context.select((ApplicationBloc bloc) => bloc.state.status),
            onGeneratePages: onGenerateAppViewPages,
          ),
        );
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('UFO Login'),
      ),
      body: const Center(),
    );
  }
}
