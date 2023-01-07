import 'package:equatable/equatable.dart';

class Player extends Equatable {
  const Player({
    required this.name,
    required this.role,
    required this.image,
  });

  final String name;
  final String role;
  final String image;

  @override
  List<Object?> get props => [
        name,
        role,
        image,
      ];
}
