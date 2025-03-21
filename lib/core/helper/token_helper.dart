import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenHelper {
  final storage = const FlutterSecureStorage();

  Future<String> getToken() async {
    String data = await storage.read(key: 'token') ?? '-';
    return data;
  }

  Future<String> setToken(var token) async {
    await storage.write(key: 'token', value: token);
    return 'done';
  }

  Future<String> deleteAllToken() async {
    await storage.deleteAll();
    return 'done';
  }
}
