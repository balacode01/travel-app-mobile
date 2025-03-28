import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _localStorage = FlutterSecureStorage();
  static const _keyToken = "jwt_token";
  static const _userId = "user_id";
  // save jwt token
  static Future<void> saveToken(String token) async {
    await _localStorage.write(key: _keyToken, value: token);
  }

  // retrive jwt token
  static Future<String?> getToken() async {
    return await _localStorage.read(key: _keyToken);
  }

  // delete jwt token
  static Future<void> deleteToken() async {
    await _localStorage.delete(key: _keyToken);
  }

  // check is user is logged in by verifying the stored token
  static Future<bool> isUserLoggedIn() async {
    String? token = await TokenStorage.getToken();
    return token != null;
  }

  /// save user id ///
  static Future<void> saveUserId(String userId) async {
    await _localStorage.write(key: _userId, value: userId);
  }

  /// get User Id ///
  static Future<String?> getUserId() async {
    return _localStorage.read(key: _userId);
  }

  /// delete User Id ///
  static Future<void> deleteUserId() async {
    await _localStorage.delete(key: _userId);
  }
}
