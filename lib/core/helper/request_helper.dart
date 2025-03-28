import 'package:http/http.dart';

class RequestHelper {
  static String getBaseUrl = 'http://projectme.tech/api';
  static String version = 'v1';
  static String baseUrl = '$getBaseUrl/$version';

  static Uri auth = Uri.parse('$baseUrl/auth');
  static Uri login = Uri.parse('$baseUrl/login');
  static Uri register = Uri.parse('$baseUrl/register');

  static getHeaderGet(var token) {
    Map<String, String> data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  static getHeaderPost(var token) {
    Map<String, String> data = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  static Response timeOutException() {
    return Response(
      '{"message":"Connection Timeout"}',
      408,
    );
  }
}
