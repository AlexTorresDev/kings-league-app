import 'package:kings_league_app/src/domain/entities/entities.dart';

class PresidentModel extends President {
  const PresidentModel({
    required String id,
    required String name,
    required String image,
    required String teamId,
  }) : super(
          id: id,
          name: name,
          image: image,
          teamId: teamId,
        );

  factory PresidentModel.fromJson(Map<String, dynamic> json) => PresidentModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        teamId: json["teamId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "teamId": teamId,
      };
}
