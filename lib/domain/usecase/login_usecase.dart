// domain/usecases/login_usecase.dart

import '../entity/auth_user.dart';
import '../repo/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthUser> execute(String email, String password) {
    return repository.login(email, password);
  }
}
