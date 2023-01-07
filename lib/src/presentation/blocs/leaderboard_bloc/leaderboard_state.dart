import 'package:equatable/equatable.dart';
import 'package:kings_league_app/src/domain/entities/entities.dart';

abstract class LeaderboardState extends Equatable {
  const LeaderboardState([this._props = const []]);

  final List<Object?> _props;

  @override
  List<Object?> get props => [_props];
}

class LeaderboardLoading extends LeaderboardState {}

class LeaderboardError extends LeaderboardState {
  LeaderboardError(this.message) : super([message]);
  final String message;
}

class LeaderboardLoaded extends LeaderboardState {
  LeaderboardLoaded(this.leaderboard) : super([leaderboard]);
  final List<Leaderboard> leaderboard;
}
