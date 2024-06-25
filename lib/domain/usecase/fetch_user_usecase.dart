import '../../data/model/user_list_model.dart';
import '../repo/user_repository.dart';

class FetchUsersUseCase {
  final UserRepository repository;

  FetchUsersUseCase(this.repository);

  Future<List<UserListModel>> execute() async {
    return await repository.fetchUsers();
  }
}
