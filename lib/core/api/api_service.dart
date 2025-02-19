import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app_mobile/core/api/api_constants.dart';
import '../models/response_model/user_model.dart';

class ApiService {
  Future<UserModel> registerUser(Map<String, dynamic> requestBody) async {
    // base url
    final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.registerEp}");

    final response = await http.post(
      headers: {"Content-Type": "application/json"},
      url,
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return UserModel.fromJson(responseData["user"]);
    } else {
      throw Exception("Failed to register user");
    }
  }

  /// generate otp api
}
