import 'package:equatable/equatable.dart';

import 'team.dart';

class Leaderboard extends Equatable {
  const Leaderboard({
    required this.wins,
    required this.losses,
    required this.scoredGoals,
    required this.concededGoals,
    required this.yellowCards,
    required this.redCards,
    required this.team,
    required this.rank,
  });

  final int wins;
  final int losses;
  final int scoredGoals;
  final int concededGoals;
  final int yellowCards;
  final int redCards;
  final Team team;
  final int rank;

  @override
  List<Object?> get props => [
        wins,
        losses,
        scoredGoals,
        concededGoals,
        yellowCards,
        redCards,
        team,
        rank,
      ];
}
