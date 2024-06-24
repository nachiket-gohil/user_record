import '../entity/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> login(String email, String password);

  Future<AuthUser> signUp(String email, String password);

  Future<void> logout();
}
