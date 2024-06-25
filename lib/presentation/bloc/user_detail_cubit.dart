import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/user_list_model.dart';
import '../../domain/usecase/fetch_user_details_usecase.dart';

class UserDetailState {
  final UserListModel? user;
  final bool loading;
  final String? error;

  UserDetailState({
    this.user,
    this.loading = false,
    this.error,
  });

  UserDetailState copyWith({
    UserListModel? user,
    bool? loading,
    String? error,
  }) {
    return UserDetailState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

class UserDetailCubit extends Cubit<UserDetailState> {
  final FetchUserDetailUseCase fetchUserDetailUseCase;

  UserDetailCubit(this.fetchUserDetailUseCase) : super(UserDetailState());

  Future<void> fetchUserDetail(int id) async {
    try {
      emit(state.copyWith(loading: true));
      final user = await fetchUserDetailUseCase.execute(id);
      emit(state.copyWith(user: user, loading: false));
      print(">>> Fetchh Usserrr Dettails Cubit <<<");
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
      print(">>> Fetchh Usserrr Dettails Error Cubit <<<");
    }
  }
}
