import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/check_auth_status_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/logout_usecase.dart';
import '../../domain/usecase/signup_usecase.dart';

/// State

class AuthState {
  final bool isAuthenticated;
  String? errorMessage;

  AuthState({required this.isAuthenticated, this.errorMessage});

  factory AuthState.initial() {
    return AuthState(isAuthenticated: false);
  }

  AuthState copyWith({bool? isAuthenticated, String? errorMessage}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Cubit

class AuthCubit extends Cubit<AuthState> {
  final CheckAuthStatusUseCase checkAuthStatusUseCase;
  final LoginUseCase loginUseCase;
  final SignupUseCase signUpUseCase;
  final LogoutUseCase logoutUseCase;

  AuthCubit({
    required this.checkAuthStatusUseCase,
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.logoutUseCase,
  }) : super(AuthState.initial());

  Future<void> checkAuthStatus() async {
    final user = await checkAuthStatusUseCase();
    emit(state.copyWith(isAuthenticated: user != null));
  }

  Future<void> login(String email, String password) async {
    try {
      await loginUseCase(email, password);
      emit(state.copyWith(isAuthenticated: true, errorMessage: null));
      print(">>> User Authenticated Loginnn<<<");
    } on FirebaseAuthException catch (e) {
      String errorMessage = _handleLoginError(e.code);
      print(">>> User Authenticated Excpetion:: ${e.code} <<<");
      emit(state.copyWith(errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      print(">>> User Authenticated Login Errroorr<<<");
    }
  }

  Future<void> signup(String email, String password) async {
    try {
      await signUpUseCase(email, password);
      emit(state.copyWith(isAuthenticated: true, errorMessage: null));
      print(">>> User Authenticated Signuppp<<<");
    } on FirebaseAuthException catch (e) {
      String errorMessage = _handleSignupError(e.code);
      emit(state.copyWith(errorMessage: errorMessage));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
      print(">>> User Authenticated Signup error<<<");
    }
  }

  Future<void> logout() async {
    await logoutUseCase();
    emit(state.copyWith(isAuthenticated: false));
    print(">>> User Logouttt <<<");
  }

  String _handleLoginError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'User not found. Please register first.';
      case 'wrong-password':
        return 'Wrong password. Please try again.';
      case 'invalid-credential':
        return 'User not found. Please register first.';
      default:
        return 'Login failed. Please try again later.';
    }
  }

  String _handleSignupError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'invalid-email':
        return 'The email address is not valid.';
      default:
        return 'Authentication failed. Please try again later.';
    }
  }
}
