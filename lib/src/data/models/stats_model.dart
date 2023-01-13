import 'package:kings_league_app/src/domain/entities/entities.dart';

class StatsModel extends Stats {
  const StatsModel({
    int? speed,
    int? physique,
    int? shooting,
    int? passing,
    int? talent,
    int? defense,
    int? score,
    int? reflexes,
    int? saves,
    int? kickoff,
    int? stretch,
  }) : super(
          speed: speed,
          physique: physique,
          shooting: shooting,
          passing: passing,
          talent: talent,
          defense: defense,
          score: score,
          reflexes: reflexes,
          saves: saves,
          kickoff: kickoff,
          stretch: stretch,
        );

  factory StatsModel.fromJson(Map<String, dynamic> json) => StatsModel(
        speed: json["speed"],
        physique: json["physique"],
        shooting: json["shooting"],
        passing: json["passing"],
        talent: json["talent"],
        defense: json["defense"],
        score: json["score"],
        reflexes: json["reflexes"],
        saves: json["saves"],
        kickoff: json["kickoff"],
        stretch: json["stretch"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "physique": physique,
        "shooting": shooting,
        "passing": passing,
        "talent": talent,
        "defense": defense,
        "score": score,
        "reflexes": reflexes,
        "saves": saves,
        "kickoff": kickoff,
        "stretch": stretch,
      };
}
