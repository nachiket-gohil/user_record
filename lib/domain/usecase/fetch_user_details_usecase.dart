import '../../data/model/user_list_model.dart';
import '../repo/user_repository.dart';

class FetchUserDetailUseCase {
  final UserRepository repository;

  FetchUserDetailUseCase(this.repository);

  Future<UserListModel> execute(int id) async {
    return await repository.fetchUserDetail(id);
  }
}
