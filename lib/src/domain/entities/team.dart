import 'package:equatable/equatable.dart';

import 'player.dart';
import 'president.dart';
import 'coach.dart';

class Team extends Equatable {
  const Team({
    required this.id,
    this.color,
    required this.name,
    required this.image,
    this.imageWhite,
    required this.url,
    this.presidentId,
    required this.channel,
    required this.socialNetworks,
    required this.players,
    required this.shortName,
    this.coach,
    this.coachInfo,
    this.president,
    this.rank,
  });

  final String id;
  final String? color;
  final String name;
  final String image;
  final String? imageWhite;
  final String url;
  final String? presidentId;
  final String channel;
  final List<String> socialNetworks;
  final List<Player> players;
  final String shortName;
  final String? coach;
  final Coach? coachInfo;
  final President? president;
  final int? rank;

  @override
  List<Object?> get props => [
        id,
        color,
        name,
        image,
        imageWhite,
        url,
        presidentId,
        channel,
        socialNetworks,
        players,
        shortName,
        coach,
        coachInfo,
        president,
        rank,
      ];
}
