import 'package:equatable/equatable.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

abstract class PresidentState extends Equatable {
  const PresidentState([this._props = const []]);

  final List<Object?> _props;

  @override
  List<Object?> get props => [_props];
}

class PresidentLoading extends PresidentState {}

class PresidentError extends PresidentState {
  PresidentError(this.message) : super([message]);
  final String message;
}

class PresidentLoaded extends PresidentState {
  PresidentLoaded(this.president) : super([president]);
  final President president;
}
