import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/domain/use_cases/use_cases.dart';
import 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit(this._getLeaderboard) : super(LeaderboardLoading());

  final GetLeaderboard _getLeaderboard;

  void getAll() async {
    final result = await _getLeaderboard.call();

    result.fold(
      (failure) {
        emit(LeaderboardError(failure.message));
      },
      (data) {
        emit(LeaderboardLoaded(data));
      },
    );
  }
}
