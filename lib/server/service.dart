import 'package:authentication/server/http_routes.dart';
import 'package:http/http.dart' as http;

class Service {
  static final client = http.Client();


  static buildUrl(String endpoint, String params) {
    String host = HttpRoutes.BASE_URL;
    String api = host + endpoint + params;
    print(api);
    return Uri.parse(api);
  }

  static Future<dynamic> auth(var body, String endpoint, String params) async {
    var response = await client.post(
      buildUrl(endpoint, params),
      body: body,
      headers: {
        "Content-Type": "application/json",
        'Charset': 'utf-8',
        'Accept': 'application/json',
      },
    );
    return response.body;
  }

  static Future<dynamic> post(var body, String endpoint, String token, String params) async {
    var response = await client.post(
      buildUrl(endpoint, params),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response.body;
  }

  static Future<dynamic> postWB(String endpoint, String token, String params) async {
    var response = await client.post(
      buildUrl(endpoint, params),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response.body;
  }

  static Future<dynamic> get(String endpoint, String token, String params) async {
    var response = await client.get(
        buildUrl(endpoint, params),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        });
    return response.body;
  }

  static Future<dynamic> patch(var body, String endpoint, String token, String params) async {
    var response = await client.patch(
      buildUrl(endpoint, params),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response.body;
  }

  static Future<dynamic> delete(var body, String endpoint, String token, String params) async {
    var response = await client.delete(
      buildUrl(endpoint, params),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response.body;
  }
}