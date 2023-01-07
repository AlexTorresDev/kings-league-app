import 'package:kings_league_app/src/domain/entities/entities.dart';

class TopScorerModel extends TopScorer {
  const TopScorerModel({
    required int rank,
    required String playerName,
    required int gamesPlayed,
    required int goals,
    required String team,
    required String image,
  }) : super(
          rank: rank,
          playerName: playerName,
          gamesPlayed: gamesPlayed,
          goals: goals,
          team: team,
          image: image,
        );

  factory TopScorerModel.fromJson(Map<String, dynamic> json) => TopScorerModel(
        rank: json["rank"],
        playerName: json["playerName"],
        gamesPlayed: json["gamesPlayed"],
        goals: json["goals"],
        team: json["team"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "playerName": playerName,
        "gamesPlayed": gamesPlayed,
        "goals": goals,
        "team": team,
        "image": image,
      };
}
