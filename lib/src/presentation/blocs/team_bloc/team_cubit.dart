import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/domain/use_cases/use_cases.dart';
import 'team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  TeamCubit(this._getTeam) : super(TeamLoading());

  final GetTeam _getTeam;

  void getById(String id) async {
    final result = await _getTeam.call(id);

    result.fold(
      (failure) {
        emit(TeamError(failure.message));
      },
      (data) {
        emit(TeamLoaded(data));
      },
    );
  }
}
