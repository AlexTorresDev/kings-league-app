import 'package:dartz/dartz.dart';
import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'package:kings_league_app/src/domain/repositories/repositories.dart';

class GetPresident {
  const GetPresident(this.repository);

  final PresidentRepository repository;

  Future<Either<Failure, President>> call(String id) =>
      repository.getPresident(id);
}
