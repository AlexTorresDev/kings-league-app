import 'package:kings_league_app/src/domain/entities/entities.dart';

class ScheduleModel extends Schedule {
  const ScheduleModel({
    required String date,
    required List<MatchModel> matches,
  }) : super(
          date: date,
          matches: matches,
        );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        date: json["date"],
        matches: List<MatchModel>.from(
            json["matches"].map((x) => MatchModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "matches":
            (matches as List<MatchModel>).map((x) => x.toJson()).toList(),
      };
}

class MatchModel extends Match {
  const MatchModel({
    int? timestamp,
    String? hour,
    required List<LocalTeamModel> teams,
    required String score,
  }) : super(
          timestamp: timestamp,
          hour: hour,
          teams: teams,
          score: score,
        );

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        timestamp: json["timestamp"],
        hour: json["hour"],
        teams: List<LocalTeamModel>.from(
            json["teams"].map((x) => LocalTeamModel.fromJson(x))),
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp,
        "hour": hour,
        "teams":
            (teams as List<LocalTeamModel>).map((x) => x.toJson()).toList(),
        "score": score,
      };
}

class LocalTeamModel extends LocalTeam {
  const LocalTeamModel({
    required String id,
    required String name,
    required String shortName,
  }) : super(
          id: id,
          name: name,
          shortName: shortName,
        );

  factory LocalTeamModel.fromJson(Map<String, dynamic> json) => LocalTeamModel(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
      };
}
