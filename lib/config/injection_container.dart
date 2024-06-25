import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:user_record/domain/usecase/check_auth_status_usecase.dart';
import 'package:user_record/domain/usecase/signup_usecase.dart';

import '../data/repo/auth_repository_impl.dart';
import '../data/repo/user_repository_impl.dart';
import '../data/sources/api_data_source.dart';
import '../data/sources/remote_data_source.dart';
import '../domain/repo/auth_repository.dart';
import '../domain/repo/user_repository.dart';
import '../domain/usecase/fetch_user_details_usecase.dart';
import '../domain/usecase/fetch_user_usecase.dart';
import '../domain/usecase/login_usecase.dart';
import '../domain/usecase/logout_usecase.dart';
import '../presentation/bloc/auth_cubit.dart';
import '../presentation/bloc/user_detail_cubit.dart';
import '../presentation/bloc/user_list_cubit.dart';
import 'dio_mixin.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  // final firebaseAuth = FirebaseAuth.instance;
  // sl.registerLazySingleton(() => firebaseAuth);

  // Dio
  sl.registerLazySingleton(
    () => DioClient(Dio(), FirebaseAnalytics.instance, FirebaseAuth.instance).dio,
  );

  // Data Sources
  sl.registerLazySingleton(() => RemoteDataSource(FirebaseAuth.instance));
  sl.registerLazySingleton(() => UserRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => CheckAuthStatusUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => FetchUsersUseCase(sl()));
  sl.registerLazySingleton(() => FetchUserDetailUseCase(sl()));

  // Cubits
  sl.registerFactory(() => AuthCubit(
        checkAuthStatusUseCase: sl(),
        loginUseCase: sl(),
        signUpUseCase: sl(),
        logoutUseCase: sl(),
      ));
  sl.registerFactory(() => UserListCubit(sl()));
  sl.registerFactory(() => UserDetailCubit(sl()));
}
