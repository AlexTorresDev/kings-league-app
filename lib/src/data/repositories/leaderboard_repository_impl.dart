import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kings_league_app/src/core/errors/exceptions.dart';
import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/data/data_sources/remote_data_source.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';

class LeaderboardRepositoryImpl implements LeaderboardRepository {
  LeaderboardRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<Leaderboard>>> getLeaderboard() async {
    try {
      final remoteLeaderboard = await remoteDataSource.getLeaderboard();
      return Right(remoteLeaderboard);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
