import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = "jwt_token";

  // save jwt token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  // retrive jwt token
  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  // delete jwt token
  static Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  // check is user is logged in by verifying the stored token
  static Future<bool> isUserLoggedIn() async {
    String? token = await TokenStorage.getToken();
    return token != null;
  }
}
