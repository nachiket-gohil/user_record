import 'package:dio/dio.dart';
import 'package:user_record/config/dio_mixin.dart';

import '../../core/constants/urls.dart';
import '../model/auth_user_model.dart';

class ApiDataSource with BaseDio {
  ApiDataSource();

  Future<List<UserModel>> getUsers() async {
    Dio dio = await getBaseDio(requiredToken: true);
    try {
      final response = await dio.get(
        Urls.users,
      );
      return (response.data as List).map((user) => UserModel.fromJson(user)).toList();
    } on DioException catch (e) {
      // Handle error here
      throw Exception('Failed to load users');
    }
  }
}
