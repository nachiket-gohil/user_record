import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/constants/urls.dart';
import '../model/user_list_model.dart';

class UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSource(this.dio);

  Future<List<UserListModel>> fetchUsers() async {
    final response = await dio.get(Urls.baseUrl + Urls.users);
    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        responseHeader: kDebugMode,
        responseBody: kDebugMode,
        error: kDebugMode,
      ),
    );
    print(">>> Fetched Usserrr at Source<<<");
    return (response.data as List).map((json) => UserListModel.fromJson(json)).toList();
  }

  Future<UserListModel> fetchUserDetail(int id) async {
    final response = await dio.get('${Urls.baseUrl}${Urls.users}/$id');
    print(">>> Fetched Usserr Dettails at Source<<<");
    return UserListModel.fromJson(response.data);
  }
}
