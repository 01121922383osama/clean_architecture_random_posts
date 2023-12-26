import 'package:clean_architecture/Core/API/api_consumer.dart';
import 'package:clean_architecture/Core/API/app_interceptors.dart';
import 'package:clean_architecture/Core/API/dio_consumer.dart';
import 'package:clean_architecture/Core/Network/network_info.dart';
import 'package:clean_architecture/features/Splah/data/datasources/lang_local_data_source.dart';
import 'package:clean_architecture/features/Splah/data/repositories/lang_repository_impl.dart';
import 'package:clean_architecture/features/Splah/domain/repositories/lang_repository.dart';
import 'package:clean_architecture/features/Splah/domain/usecases/cahnge_local.dart';
import 'package:clean_architecture/features/Splah/domain/usecases/get_save_data.dart';
import 'package:clean_architecture/features/Splah/presentation/cubit/locale_cubit.dart';
import 'package:clean_architecture/features/random_qoute/data/datasources/randome_qoute_local_data_sourece.dart';
import 'package:clean_architecture/features/random_qoute/data/datasources/randome_qoute_remote_data_sourece.dart';
import 'package:clean_architecture/features/random_qoute/data/repositories/qoute_repository_impl.dart';
import 'package:clean_architecture/features/random_qoute/domain/repositories/qoute_reposatory.dart';
import 'package:clean_architecture/features/random_qoute/domain/usecases/get_random_qoute.dart';
import 'package:clean_architecture/features/random_qoute/presentation/cubit/random_qoute_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
// feature
  // bloc
  sl.registerFactory(() => RandomQouteCubit(randomeQuoteUseCase: sl()));
  sl.registerFactory(
      () => LocaleCubit(changeLangUseCase: sl(), getSaveLangUseCase: sl()));

// usecases
  sl.registerLazySingleton(() => GetRandomeQuote(qouteRepository: sl()));
  sl.registerLazySingleton(() => GetSaveLangUseCase(langRepository: sl()));
  sl.registerLazySingleton(() => ChangeLangUseCases(langRepository: sl()));

  // repository
  sl.registerLazySingleton<QouteRepository>(() => QouteRepositoryImpl(
        networkInfo: sl(),
        qouteLocalDataSource: sl(),
        qouteRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(
        localDataSource: sl(),
      ));
// datasource
  sl.registerLazySingleton<RandomeQouteLocalDataSource>(
      () => RandomeQouteLocalDataSourceImpl(preferences: sl()));
  sl.registerLazySingleton<RandomeQouteRemoteDataSource>(
      () => RandomeQouteRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(preferences: sl()));
// core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));
// external

  final SharedPreferences preferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => preferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => AppIntercepters());
  sl.registerLazySingleton(() => LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
