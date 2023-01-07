import 'package:dartz/dartz.dart';

import 'package:kings_league_app/src/core/errors/failure.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

abstract class PresidentRepository {
  Future<Either<Failure, President>> getPresident(String id);
}
