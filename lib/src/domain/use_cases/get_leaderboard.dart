import 'package:dartz/dartz.dart';
import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';

class GetLeaderboard {
  const GetLeaderboard(this.repository);

  final LeaderboardRepository repository;

  Future<Either<Failure, List<Leaderboard>>> call() =>
      repository.getLeaderboard();
}
