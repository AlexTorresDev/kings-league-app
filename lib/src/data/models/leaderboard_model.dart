import 'package:kings_league_app/src/data/models/team_model.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

class LeaderboardModel extends Leaderboard {
  const LeaderboardModel({
    required int wins,
    required int losses,
    required int scoredGoals,
    required int concededGoals,
    required int yellowCards,
    required int redCards,
    required Team team,
    required int rank,
  }) : super(
          wins: wins,
          losses: losses,
          scoredGoals: scoredGoals,
          concededGoals: concededGoals,
          yellowCards: yellowCards,
          redCards: redCards,
          team: team,
          rank: rank,
        );

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) =>
      LeaderboardModel(
        wins: json["wins"],
        losses: json["losses"],
        scoredGoals: json["scoredGoals"],
        concededGoals: json["concededGoals"],
        yellowCards: json["yellowCards"],
        redCards: json["redCards"],
        team: TeamModel.fromJson(json["team"]),
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "wins": wins,
        "losses": losses,
        "scoredGoals": scoredGoals,
        "concededGoals": concededGoals,
        "yellowCards": yellowCards,
        "redCards": redCards,
        "team": (team as TeamModel).toJson(),
        "rank": rank,
      };
}
