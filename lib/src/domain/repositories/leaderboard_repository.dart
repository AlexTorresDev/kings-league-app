import 'package:dartz/dartz.dart';

import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

abstract class LeaderboardRepository {
  Future<Either<Failure, List<Leaderboard>>> getLeaderboard();
}
