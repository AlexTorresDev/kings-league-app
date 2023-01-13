import 'package:equatable/equatable.dart';

class Coach extends Equatable {
  const Coach({
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  List<Object?> get props => [
        name,
        image,
      ];
}
