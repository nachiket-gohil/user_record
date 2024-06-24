import '../../domain/entity/auth_user.dart';
import '../../domain/repo/auth_repository.dart';
import '../model/auth_user_model.dart';
import '../sources/api_data_source.dart';

class UserRepositoryImpl implements AuthRepository {
  final ApiDataSource apiDataSource;

  UserRepositoryImpl(this.apiDataSource);

  @override
  Future<AuthUser> login(String email, String password) async {
    UserModel userModel = await apiDataSource.login(email, password);
    return AuthUser(
      id: userModel.id,
      email: userModel.email,
    );
  }
}
