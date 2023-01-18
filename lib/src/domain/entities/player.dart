import 'package:equatable/equatable.dart';
import 'package:kings_league_app/src/config/enum_values.dart';
import 'stats.dart';

class Player extends Equatable {
  const Player({
    required this.id,
    this.dorsalName,
    required this.fullName,
    required this.role,
    required this.image,
    required this.stats,
  });

  final String id;
  final String? dorsalName;
  final String fullName;
  final Role role;
  final String image;
  final Stats stats;

  @override
  List<Object?> get props => [
        id,
        dorsalName,
        fullName,
        role,
        image,
        stats,
      ];
}

enum Role { jugador11, defensa, delantero, medio, portero }

final roleValues = EnumValues({
  "Defensa": Role.defensa,
  "Delantero": Role.delantero,
  "jugador 11": Role.jugador11,
  "Medio": Role.medio,
  "Portero": Role.portero
});
