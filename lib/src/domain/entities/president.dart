import 'package:equatable/equatable.dart';

class President extends Equatable {
  const President({
    required this.id,
    required this.name,
    required this.image,
    required this.teamId,
  });

  final String id;
  final String name;
  final String image;
  final String teamId;

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        teamId,
      ];
}
