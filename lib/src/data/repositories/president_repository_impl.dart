import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:kings_league_app/src/core/errors/exceptions.dart';
import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/data/data_sources/remote_data_source.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';

class PresidentRepositoryImpl implements PresidentRepository {
  PresidentRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, President>> getPresident(String id) async {
    try {
      final remotePresident = await remoteDataSource.getPresident(id);
      return Right(remotePresident);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
