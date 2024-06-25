import 'package:firebase_auth/firebase_auth.dart';

import '../entity/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> login(String email, String password);

  Future<AuthUser> signUp(String email, String password);

  Future<User?> getAuthUser();

  Future<void> logout();
}
