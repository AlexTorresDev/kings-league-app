import 'package:kings_league_app/src/domain/entities/entities.dart';

import 'player_model.dart';
import 'coach_model.dart';

class TeamModel extends Team {
  const TeamModel({
    required String id,
    String? color,
    required String name,
    required String image,
    String? imageWhite,
    required String url,
    String? presidentId,
    required String channel,
    required List<String> socialNetworks,
    required List<Player> players,
    String? coach,
    required String shortName,
    Coach? coachInfo,
  }) : super(
          id: id,
          color: color,
          name: name,
          image: image,
          imageWhite: imageWhite,
          url: url,
          presidentId: presidentId,
          channel: channel,
          socialNetworks: socialNetworks,
          players: players,
          coach: coach,
          shortName: shortName,
          coachInfo: coachInfo,
        );

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["id"],
        color: json["color"],
        name: json["name"],
        image: json["image"],
        imageWhite: json["imageWhite"],
        url: json["url"],
        presidentId: json["presidentId"],
        channel: json["channel"],
        socialNetworks: List<String>.from(json["socialNetworks"].map((x) => x)),
        players: List<Player>.from(
            json["players"].map((x) => PlayerModel.fromJson(x))),
        shortName: json["shortName"],
        coach: json["coach"],
        coachInfo: json["coachInfo"] != null
            ? CoachModel.fromJson(json["coachInfo"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "name": name,
        "image": image,
        "imageWhite": imageWhite,
        "url": url,
        "presidentId": presidentId,
        "channel": channel,
        "socialNetworks": List<dynamic>.from(socialNetworks.map((x) => x)),
        "players":
            (players as List<PlayerModel>).map((x) => x.toJson()).toList(),
        "coach": coach,
        "shortName": shortName,
        "coachInfo": (coachInfo as CoachModel).toJson(),
      };
}
