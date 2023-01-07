import 'package:equatable/equatable.dart';

class Coach extends Equatable {
  const Coach({
    required this.name,
    this.teamName,
    required this.image,
  });

  final String name;
  final String? teamName;
  final String image;

  @override
  List<Object?> get props => [name, teamName, image];
}
