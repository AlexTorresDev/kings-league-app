import 'package:equatable/equatable.dart';

class Stats extends Equatable {
  const Stats({
    this.speed,
    this.physique,
    this.shooting,
    this.passing,
    this.talent,
    this.defense,
    this.score,
    this.reflexes,
    this.saves,
    this.kickoff,
    this.stretch,
  });

  final int? speed;
  final int? physique;
  final int? shooting;
  final int? passing;
  final int? talent;
  final int? defense;
  final int? score;
  final int? reflexes;
  final int? saves;
  final int? kickoff;
  final int? stretch;

  @override
  List<Object?> get props => [
        speed,
        physique,
        shooting,
        passing,
        talent,
        defense,
        score,
        reflexes,
        saves,
        kickoff,
        stretch,
      ];
}
