import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_league_app/src/domain/use_cases/use_cases.dart';
import 'president_state.dart';

class PresidentCubit extends Cubit<PresidentState> {
  PresidentCubit(this._getPresident) : super(PresidentLoading());

  final GetPresident _getPresident;

  void getById(String id) async {
    final result = await _getPresident.call(id);

    result.fold(
      (failure) {
        emit(PresidentError(failure.message));
      },
      (data) {
        emit(PresidentLoaded(data));
      },
    );
  }
}
