import 'package:kings_league_app/src/domain/entities/entities.dart';

class TopAssistModel extends TopAssist {
  const TopAssistModel({
    required String playerName,
    required int gamesPlayed,
    required int assists,
    required int rank,
    required String team,
    required String image,
  }) : super(
          playerName: playerName,
          gamesPlayed: gamesPlayed,
          assists: assists,
          rank: rank,
          team: team,
          image: image,
        );

  factory TopAssistModel.fromJson(Map<String, dynamic> json) => TopAssistModel(
        playerName: json["playerName"],
        gamesPlayed: json["gamesPlayed"],
        assists: json["assists"],
        rank: json["rank"],
        team: json["team"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "playerName": playerName,
        "gamesPlayed": gamesPlayed,
        "assists": assists,
        "rank": rank,
        "team": team,
        "image": image,
      };
}
