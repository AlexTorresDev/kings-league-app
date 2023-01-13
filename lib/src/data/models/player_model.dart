import 'package:kings_league_app/src/domain/entities/entities.dart';
import 'stats_model.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required String id,
    String? dorsalName,
    required String fullName,
    required Role role,
    required String image,
    required StatsModel stats,
  }) : super(
          id: id,
          dorsalName: dorsalName,
          fullName: fullName,
          role: role,
          image: image,
          stats: stats,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        id: json["id"],
        dorsalName: json["dorsalName"],
        fullName: json["fullName"],
        role: roleValues.map[json["role"]]!,
        image: json["image"],
        stats: StatsModel.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dorsalName": dorsalName,
        "fullName": fullName,
        "role": roleValues.reverse![role],
        "image": image,
        "stats": (stats as StatsModel).toJson(),
      };
}
