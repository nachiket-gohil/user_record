// presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_record/config/app_route.dart';
import 'package:user_record/core/utility/snackbar.dart';

import '../bloc/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    AppRoute.logScreenNames(AppRoute.login);
    super.initState();
  }

  bool authenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          authenticated = state.isAuthenticated;
          if (state.errorMessage != null) {
            AppSnackbar.show(
              context,
              message: state.errorMessage!,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .login(
                        _emailController.text,
                        _passwordController.text,
                      )
                      .then(
                    (onValue) {
                      if (authenticated) {
                        Navigator.of(context).pushReplacementNamed(AppRoute.list);
                      }
                    },
                  );
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .signup(
                        _emailController.text,
                        _passwordController.text,
                      )
                      .then((onValue) {
                    if (authenticated) {
                      Navigator.of(context).pushReplacementNamed(AppRoute.list);
                    }
                  });
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
