import 'package:equatable/equatable.dart';

class TopScorer extends Equatable {
  const TopScorer({
    required this.rank,
    required this.playerName,
    required this.gamesPlayed,
    required this.goals,
    required this.team,
    required this.image,
  });

  final int rank;
  final String playerName;
  final int gamesPlayed;
  final int goals;
  final String team;
  final String image;

  @override
  List<Object?> get props => [
        rank,
        playerName,
        gamesPlayed,
        goals,
        team,
        image,
      ];
}
