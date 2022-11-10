import 'package:http/http.dart' as http;
import 'package:tradeswap_front/models/parish_model.dart';
import 'dart:convert';

class ParishService {
  static final String API_URL = 'https://trade-swap-backend.vercel.app/api/v1/category';

  static Future<Parish> fetchParishes() async {
  final response = await http
      .get(Uri.parse(API_URL));

  if (response.statusCode == 200) {
    return Parish.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to retrieve parishes');
  }
 }

 Parish formatParish(String responsebody) {
    final parsed = json.decode(responsebody);
    return parsed['data']
        .map<Parish>((json) => Parish.fromJson(json));
  }

  List<Parish> formatParishAsList(String responsebody) {
    final parsed = json.decode(responsebody);
    return parsed['data']
        .map<Parish>((json) => Parish.fromJson(json))
        .toList();
  }

  Future<List<Parish>> fetchParish() async {
    final response = await http.get(Uri.parse(API_URL),
    );   
    if (response.statusCode == 200) {
      print(response.body);
      return formatParishAsList(response.body);
    } else {
      throw Exception('Unable to fetch parishes from the server');
    }
  }


}
