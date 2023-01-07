import 'package:dartz/dartz.dart';
import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';

class GetTeam {
  const GetTeam(this.repository);

  final TeamRepository repository;

  Future<Either<Failure, Team>> call(String id) => repository.getTeam(id);
}
