import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app_mobile/core/api/api_constants.dart';
import 'package:travel_app_mobile/core/models/response_model/generate_otp_model.dart';
import 'package:travel_app_mobile/core/models/response_model/verify_otp_model.dart';
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

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return UserModel.fromJson(responseData["user"]);
    } else {
      throw Exception("Failed to register user");
    }
  }

  /// generate otp api
  Future<GenerateOtp> generateOtp(Map<String, dynamic> requestBody) async {
    final url = Uri.parse("${ApiConstants.baseUrl}+${ApiConstants.verifyOtp}");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return GenerateOtp.fromJson(responseData);
    } else {
      throw Exception("Failed to generate Otp");
    }
  }

  /// verify Otp
  Future<VerifyOtp> verifyOtp(Map<String, dynamic> requestBody) async {
    final url = Uri.parse("${ApiConstants.baseUrl}+${ApiConstants.verifyOtp}");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return VerifyOtp.fromJson(responseData);
    } else {
      throw Exception("Failed to verify Otp");
    }
  }
}
