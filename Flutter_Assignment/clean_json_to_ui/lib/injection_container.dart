import 'package:clean_json_to_ui/features/home_screen/data/datasources/home_screen_remote_data_source.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/home_screen/data/datasources/home_screen_local_data_source.dart';
import 'features/home_screen/data/repositories/home_screen_repository_impl.dart';
import 'features/home_screen/domain/repositories/home_screen_repository.dart';
import 'features/home_screen/domain/usecases/home_screen_offline_data.dart';
import 'features/home_screen/domain/usecases/home_screen_online_data.dart';
import 'features/home_screen/presentation/bloc/home_screen_bloc.dart';

// Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  sl.registerFactory(
    () => HomeScreenBloc(
      homeScreenOfflineData: sl(),
      homeScreenOnlineData: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => HomeScreenOfflineData(sl()));
  sl.registerLazySingleton(() => HomeScreenOnlineData(sl()));

  // Repository
  sl.registerLazySingleton<HomeScreenRepository>(
    () => HomeScreenRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<HomeScreenRemoteDataSource>(
    () => HomeScreenRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<HomeScreenLocalDataSource>(
    () => HomeScreenLocalDataSourceImpl(),
  );

  //! Core

  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //
  // //! External
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerSingletonAsync(() async => sharedPreferences);
  // sl.registerLazySingleton(() => http.Client());
  // sl.registerLazySingleton(() => DataConnectionChecker());
}
