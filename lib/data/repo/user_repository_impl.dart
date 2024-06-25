import '../../domain/repo/user_repository.dart';
import '../model/user_list_model.dart';
import '../sources/api_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<List<UserListModel>> fetchUsers() async {
    return await userRemoteDataSource.fetchUsers();
  }

  @override
  Future<UserListModel> fetchUserDetail(int id) async {
    return await userRemoteDataSource.fetchUserDetail(id);
  }
}
