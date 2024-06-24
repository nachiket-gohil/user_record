import '../entity/auth_user.dart';
import '../repo/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<AuthUser> execute(String email, String password) {
    return repository.signUp(email, password);
  }
}
