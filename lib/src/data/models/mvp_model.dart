import 'package:kings_league_app/src/domain/entities/entities.dart';

class MvpModel extends Mvp {
  const MvpModel({
    required String playerName,
    required int gamesPlayed,
    required int mvps,
    required int rank,
    required String team,
    required String image,
  }) : super(
          playerName: playerName,
          gamesPlayed: gamesPlayed,
          mvps: mvps,
          rank: rank,
          team: team,
          image: image,
        );

  factory MvpModel.fromJson(Map<String, dynamic> json) => MvpModel(
        playerName: json["playerName"],
        gamesPlayed: json["gamesPlayed"],
        mvps: json["mvps"],
        rank: json["rank"],
        team: json["team"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "playerName": playerName,
        "gamesPlayed": gamesPlayed,
        "mvps": mvps,
        "rank": rank,
        "team": team,
        "image": image,
      };
}
