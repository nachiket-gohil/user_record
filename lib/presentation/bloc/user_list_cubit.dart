import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user_list_model.dart';
import '../../domain/usecase/fetch_user_usecase.dart';

class UserListState {
  final List<UserListModel> users;
  final bool loading;
  final String? error;

  UserListState({
    required this.users,
    this.loading = false,
    this.error,
  });

  UserListState copyWith({
    List<UserListModel>? users,
    bool? loading,
    String? error,
  }) {
    return UserListState(
      users: users ?? this.users,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

class UserListCubit extends Cubit<UserListState> {
  final FetchUsersUseCase fetchUsersUseCase;

  UserListCubit(this.fetchUsersUseCase) : super(UserListState(users: []));

  Future<void> fetchUsers() async {
    try {
      emit(state.copyWith(loading: true));
      final users = await fetchUsersUseCase.execute();
      emit(state.copyWith(users: users, loading: false));
      print(">>> Fetchh Usserrr Cubit <<<");
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
      print(">>> Fetchh Usserrr ERRROR Cubit <<<");
    }
  }
}
