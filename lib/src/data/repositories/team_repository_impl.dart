import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kings_league_app/src/core/errors/exceptions.dart';
import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/data/data_sources/remote_data_source.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';

class TeamRepositoryImpl implements TeamRepository {
  TeamRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Team>> getTeam(String id) async {
    try {
      final remoteTeam = await remoteDataSource.getTeam(id);
      return Right(remoteTeam);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
