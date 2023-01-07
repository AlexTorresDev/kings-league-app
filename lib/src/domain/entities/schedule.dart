import 'package:equatable/equatable.dart';

class Schedule extends Equatable {
  const Schedule({
    required this.date,
    required this.matches,
  });

  final String date;
  final List<Match> matches;

  @override
  List<Object?> get props => [
        date,
        matches,
      ];
}

class Match extends Equatable {
  const Match({
    this.timestamp,
    this.hour,
    required this.teams,
    required this.score,
  });

  final int? timestamp;
  final String? hour;
  final List<LocalTeam> teams;
  final String score;

  @override
  List<Object?> get props => [
        timestamp,
        hour,
        teams,
        score,
      ];
}

class LocalTeam extends Equatable {
  const LocalTeam({
    required this.id,
    required this.name,
    required this.shortName,
  });

  final String id;
  final String name;
  final String shortName;

  @override
  List<Object?> get props => [
        id,
        name,
        shortName,
      ];
}
