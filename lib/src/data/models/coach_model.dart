import 'package:kings_league_app/src/domain/entities/entities.dart';

class CoachModel extends Coach {
  const CoachModel({
    required String name,
    required String image,
  }) : super(
          name: name,
          image: image,
        );

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
