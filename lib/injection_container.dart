import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:utilapp/application/network/network_client.dart';
import 'package:utilapp/application/network/network_info.dart';
import 'package:utilapp/data/maps/datasources/list_locations_remote_datasource.dart';
import 'package:utilapp/data/maps/repository/list_location_repository_impl.dart';
import 'package:utilapp/domain/maps/repository/get_list_locations_repository.dart';
import 'package:utilapp/domain/maps/usecase/get_list_of_locations.dart';
import 'package:utilapp/presentation/maps/bloc/list_locations_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencyInjection() async {
  //Bloc
  sl.registerFactory(
      () => ListCollegeLocationsBloc(getListOfCollegeLocations: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetListOfCollegeLocationsImpl(sl()));
  // Repository

  sl.registerLazySingleton<ListCollegeLocationsRepository>(
    () => ListCollegeLocationsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  // Data sources
  sl.registerLazySingleton<ListCollegeLocationsRemoteDataSource>(
    () => ListCollegeLocationsRemoteDataSourceImpl(
      sl(),
    ),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );
  sl.registerLazySingleton<NetworkClient>(
    () => NetworkClient(),
  );
  // External
  sl.registerLazySingleton(() => DataConnectionChecker());
}
