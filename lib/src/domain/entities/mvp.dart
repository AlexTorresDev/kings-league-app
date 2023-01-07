import 'package:equatable/equatable.dart';

class Mvp extends Equatable {
  const Mvp({
    required this.playerName,
    required this.gamesPlayed,
    required this.mvps,
    required this.rank,
    required this.team,
    required this.image,
  });

  final String playerName;
  final int gamesPlayed;
  final int mvps;
  final int rank;
  final String team;
  final String image;

  @override
  List<Object?> get props => [
        playerName,
        gamesPlayed,
        mvps,
        rank,
        team,
        image,
      ];
}
