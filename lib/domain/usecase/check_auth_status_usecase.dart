import 'package:firebase_auth/firebase_auth.dart';

import '../repo/auth_repository.dart';

class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  Future<User?> call() {
    return repository.getAuthUser();
  }
}
