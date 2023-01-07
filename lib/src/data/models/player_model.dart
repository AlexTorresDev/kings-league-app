import 'package:kings_league_app/src/domain/entities/entities.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required String name,
    required String role,
    required String image,
  }) : super(
          name: name,
          role: role,
          image: image,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        name: json["name"],
        role: json["role"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "role": role,
        "image": image,
      };
}
