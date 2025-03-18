import 'package:http/http.dart';

class RequestHelper {
  static String getBaseUrl = 'http://projectme.tech/api';
  static String version = 'v1';
  static String baseUrl = '$getBaseUrl/$version';

  static Uri auth = Uri.parse('$getBaseUrl/auth');
  static Uri login = Uri.parse('$getBaseUrl/login');
  static Uri register = Uri.parse('$getBaseUrl/register');

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
