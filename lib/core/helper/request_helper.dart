import 'package:http/http.dart';

class RequestHelper {
  static String getBaseUrl = 'https://woodman.projectme.tech';
  static String version = 'api/v1';
  static String baseUrl = '$getBaseUrl/$version';

  static Uri auth = Uri.parse('$baseUrl/auth');
  static Uri login = Uri.parse('$baseUrl/login');
  static Uri register = Uri.parse('$baseUrl/register');

  static Uri productList = Uri.parse('$baseUrl/product');
  static Uri productDetail = Uri.parse('$baseUrl/detail-product');

  static Uri cart = Uri.parse('$baseUrl/cart');
  static Uri addCart = Uri.parse('$baseUrl/cart/add');
  static Uri deleteCart = Uri.parse('$baseUrl/cart/delete');

  static Uri getAddress = Uri.parse('$baseUrl/get-address');
  static Uri setAddress = Uri.parse('$baseUrl/set-address');

  static Uri editPassword = Uri.parse('$baseUrl/edit-password');

  static Uri makeOrder = Uri.parse('$baseUrl/make-order');
  static Uri orderList = Uri.parse('$baseUrl/get-order');

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
