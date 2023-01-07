import 'package:equatable/equatable.dart';

class TopAssist extends Equatable {
  const TopAssist({
    required this.playerName,
    required this.gamesPlayed,
    required this.assists,
    required this.rank,
    required this.team,
    required this.image,
  });

  final String playerName;
  final int gamesPlayed;
  final int assists;
  final int rank;
  final String team;
  final String image;

  @override
  List<Object?> get props => [
        playerName,
        gamesPlayed,
        assists,
        rank,
        team,
        image,
      ];
}
