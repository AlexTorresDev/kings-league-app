import 'dart:convert';

import 'package:kings_league_app/src/core/errors/exceptions.dart';
import 'package:kings_league_app/src/core/network/client_service.dart';
import 'package:kings_league_app/src/data/models/models.dart';

abstract class RemoteDataSource {
  Future<List<LeaderboardModel>> getLeaderboard();
  Future<TeamModel> getTeam(String id);
  Future<PresidentModel> getPresident(String id);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });

  final ClientService client;

  @override
  Future<List<LeaderboardModel>> getLeaderboard() async {
    final response = await client.get('/leaderboard');

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      final leaderboard =
          json.map((item) => LeaderboardModel.fromJson(item)).toList();
      return leaderboard;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TeamModel> getTeam(String id) async {
    final response = await client.get('/teams/$id');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final team = TeamModel.fromJson(json);
      return team;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PresidentModel> getPresident(String id) async {
    final response = await client.get('/presidents/$id');

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final president = PresidentModel.fromJson(json);
      return president;
    } else {
      throw ServerException();
    }
  }
}
