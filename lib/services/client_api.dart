import 'package:http/http.dart' as http;
import 'package:tradeswap_front/models/client_model.dart';
import 'dart:convert';

class ClientService {
  static final String API_URL = 'https://trade-swap-backend.vercel.app/api/v1/users';

  static Future<Client> fetchClients() async {
  final response = await http
      .get(Uri.parse(API_URL));

  if (response.statusCode == 200) {
    return Client.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to retrieve clients');
  }
 }

 Client formatClient(String responsebody) {
    final parsed = json.decode(responsebody);
    return parsed['data']
        .map<Client>((json) => Client.fromJson(json));
  }

  List<Client> formatClientAsList(String responsebody) {
    final parsed = json.decode(responsebody);
    return parsed['data']
        .map<Client>((json) => Client.fromJson(json))
        .toList();
  }

  Future<List<Client>> fetchClient() async {
    final response = await http.get(Uri.parse(API_URL),
    );   
    if (response.statusCode == 200) {
      print(response.body);
      return formatClientAsList(response.body);
    } else {
      throw Exception('Unable to fetch clients from the server');
    }
  }


}
