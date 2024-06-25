import '../../data/model/user_list_model.dart';

abstract class UserRepository {
  Future<List<UserListModel>> fetchUsers();

  Future<UserListModel> fetchUserDetail(int id);
}
