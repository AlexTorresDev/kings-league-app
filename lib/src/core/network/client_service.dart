import 'package:http/http.dart' show Client, Response;
import 'package:kings_league_app/src/core/framework/utils/constants.dart';

class ClientService {
  ClientService();

  final Client client = Client();

  Future<Response> get(String? url) async {
    return await client.get(
      Uri.parse('$baseURL${url ?? ''}'),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
