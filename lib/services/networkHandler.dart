import 'dart:convert';

import 'package:http/http.dart' as http;
// basically in the flutter app you
// create a state variable to store the value when it comes
// based on that value you make decisions to navigate  etc.
// this is a generic handler for all post request. it basically typed out the endpoint and all you need now is the specific endpoint
class NetworkHandler {
  static String token = "";
  static final client = http.Client();

  //an example of how to use this is here.
  //Map registerStatus = jsonDecode(await NetworkHandler.post("/registrants", {
  //       "first_name": firstName,
  //       "last_name": lastName,
  //       "email_address": emailAddress,
  //       "phoneNumber": phoneNumber,
  //       "department": department,
  //       "organization": organization
  //     }));
  //this is how it is consumed in an api call

  static Future<String> post(String endpoint, var body) async {
    var response = await client
        .post(buildUrl(segment: endpoint), body: jsonEncode(body), headers: {
      "Content-type": "application/json",
    });
    return response.body;
  }
  //an example of how to use this is here.
  //final response = await NetworkHandler.get(endpoint: '/departments');
  //this would be a get request for the departments end point of the api
  //this is how it is consumed in an api call
  static Future<String> get(
      {String endpoint = "", Object queryParams = const {}}) async {
    var response = await client.get(buildUrl(segment: endpoint), headers: {
      "Content-type": "application/json",
    });

    return response.body;
  }

  static Future<String> patch(String endpoint, var changes) async {
    var response = await client.patch(buildUrl(segment: endpoint),
        body: changes,
        headers: {
          "Content-type": "application/json",
        });

    return response.body;
  }

  static Future<String> delete(String endpoint) async {
    var response = await client.delete(buildUrl(segment: endpoint), headers: {
      "Content-type": "application/json",
    });
    print(response.body);
    return response.body;
  }
  //this is basically adding the uri... this is what every api call would use
  static buildUrl({String segment = "", queryParams = const {}}) {
    Uri uri = Uri(
      scheme: "https",
      host: "trade-swap-backend.vercel.app",
      path: "/api/v1$segment",
      // queryParameters: queryParams
    );

    return uri;
  }
}