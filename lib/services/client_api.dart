import 'package:http/http.dart' as http;
import 'package:tradeswap_front/models/client_model.dart';
import 'dart:convert';
import 'package:tradeswap_front/models/client_model.dart';

class ClientService {
  static final String API_URL = "https://trade-swap-backend.vercel.app/api/v1/users";

  Future<Client> createClient(Client client) async {
    Map data = {
      'first_name': client.first_name,
      'last_name': client.last_name,
      'email': client.email,
      'username': client.username,
      'password': client.password,
      'parishID': client.parishID,
      'roleID': client.roleID
    };
    final http.Response response = await http.post(Uri.parse(API_URL), body:data);
    print(jsonEncode(data));
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return formatClient(response.body);
    } else {
      print(response.body);

      throw Exception('Failed to post client');
    }
  }

  static Future<Client> fetchClients() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      return Client.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to retrieve clients');
    }
  }

  Client formatClient(String responsebody) {
    final parsed = json.decode(responsebody);
    return parsed['data'].map<Client>((json) => Client.fromJson(json));
  }

  List<Client> formatClientAsList(String responsebody) {
    final parsed = json.decode(responsebody);
    return parsed['data'].map<Client>((json) => Client.fromJson(json)).toList();
  }

  Future<List<Client>> fetchClient() async {
    final response = await http.get(
      Uri.parse(API_URL),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return formatClientAsList(response.body);
    } else {
      throw Exception('Unable to fetch clients from the server');
    }
  }
}
