import 'package:aletha_fitness/core/network_info/network_info.dart';
import 'package:aletha_fitness/feature/data/data_sources/exercise_data_source.dart';
import 'package:aletha_fitness/feature/data/repository_impl/exercise_repository_impl.dart';
import 'package:aletha_fitness/feature/domain/repository/exercise_repository.dart';
import 'package:aletha_fitness/feature/domain/usecase/exercise_usecase.dart';
import 'package:aletha_fitness/feature/presentation/exercise_home_screen/bloc/exercise_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => ExerciseListBloc(sl()));

  //UseCase
  sl.registerLazySingleton(() => ExerciseUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<ExerciseRepository>(
    () => ExerciseRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );

  // Datasources
  sl.registerLazySingleton<ExerciseDataSource>(
    () => ExerciseDataSourceImpl(client: sl()),
  );

  //Core
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
