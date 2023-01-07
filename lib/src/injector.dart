import 'package:get_it/get_it.dart';
import 'package:kings_league_app/src/core/network/client_service.dart';
import 'package:kings_league_app/src/data/data_sources/remote_data_source.dart';
import 'package:kings_league_app/src/data/repositories/repository_impl.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';
import 'package:kings_league_app/src/domain/use_cases/use_cases.dart';
import 'package:kings_league_app/src/presentation/blocs/blocs.dart';

final getIt = GetIt.instance;

void init() {
  // Core
  getIt
    ..registerLazySingleton(() => ClientService())

    // Use case
    ..registerLazySingleton(() => GetLeaderboard(getIt()))
    ..registerLazySingleton(() => GetTeam(getIt()))

    // BLoC
    ..registerFactory(() => LeaderboardCubit(getIt()))
    ..registerFactory(() => TeamCubit(getIt()))

    // Repository
    ..registerLazySingleton<LeaderboardRepository>(
        () => LeaderboardRepositoryImpl(remoteDataSource: getIt()))
    ..registerLazySingleton<TeamRepository>(
        () => TeamRepositoryImpl(remoteDataSource: getIt()))

    // Data sources
    ..registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(client: getIt()));
}
