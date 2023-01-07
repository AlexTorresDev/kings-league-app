import 'package:equatable/equatable.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

abstract class TeamState extends Equatable {
  const TeamState([this._props = const []]);

  final List<Object?> _props;

  @override
  List<Object?> get props => [_props];
}

class TeamLoading extends TeamState {}

class TeamError extends TeamState {
  TeamError(this.message) : super([message]);
  final String message;
}

class TeamLoaded extends TeamState {
  TeamLoaded(this.team) : super([team]);
  final Team team;
}
