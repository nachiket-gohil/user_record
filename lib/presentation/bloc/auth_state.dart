// presentation/blocs/auth/auth_state.dart

import '../../domain/entity/auth_user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final AuthUser user;

  AuthAuthenticated(this.user);
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
