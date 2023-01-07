import 'package:kings_league_app/src/domain/entities/entities.dart';

class CoachModel extends Coach {
  const CoachModel({
    required String name,
    String? teamName,
    required String image,
  }) : super(
          name: name,
          teamName: teamName,
          image: image,
        );

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
        name: json["name"],
        teamName: json["teamName"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "teamName": teamName,
        "image": image,
      };
}
