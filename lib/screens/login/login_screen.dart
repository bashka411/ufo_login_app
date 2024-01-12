import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ufo_login_app/screens/login/cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log In')),
      body: BlocProvider(
        create: (_) => LoginCubit(),
        child: const LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status == LogInStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
              ),
            );
          }
        },
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _UfoLogo(),
            _UsernameInput(),
            _PasswordInput(),
            _LogInButton(),
          ],
        ),
      );
    });
  }
}

class _UfoLogo extends StatelessWidget {
  const _UfoLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 15),
      child: Image.asset('assets/ufo_logo.png'),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: (username) => context.read<LoginCubit>().usernameChanged(username),
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Icons.person_rounded),
              border: OutlineInputBorder(),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: true,
            onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_rounded),
              border: OutlineInputBorder(),
            ),
          ),
        );
      },
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LogInStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () => context.read<LoginCubit>().login(),
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  fixedSize: const Size(250, 40),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.login_rounded),
                    SizedBox(width: 10),
                    Text('Log In'),
                  ],
                ),
              );
      },
    );
  }
}
