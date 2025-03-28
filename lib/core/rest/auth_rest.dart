import 'dart:convert';

import 'package:travel_app_mobile/core/api/api_constants.dart';
import 'package:travel_app_mobile/core/api/services.dart';
import 'package:travel_app_mobile/core/models/response_model/otp_model.dart';
import 'package:http/http.dart' as http;
import 'package:travel_app_mobile/core/models/response_model/verify_otp_model.dart';
import 'package:travel_app_mobile/core/utils/token_storage.dart';
import 'package:travel_app_mobile/core/utils/defaultHeaders.dart';

class AuthRest {
  Future<GenerateOtpResponse> loginWithOtp(String mobileNumber) async {
    GenerateOtpResponse generateOtpResponse = GenerateOtpResponse();

    Map<String, String> data = {"phone_number": mobileNumber};
    try {
      http.Response response = await serviceCall(
        headers: {"Content-Type": "application/json"},
        url: "${ApiConstants.baseUrl}${ApiConstants.generateOtp}",
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        print("=====+++++=====");
        print(response.body);
        //await TokenStorage.saveToken(response.body]);
        generateOtpResponse = GenerateOtpResponse.fromJson(
          jsonDecode(response.body),
        );
      } else {
        // generateOtpResponse. = response.statusCode;
        print('error');
      }
    } catch (e) {
      print(e);
    }

    return generateOtpResponse;
  }

  /// verify otp
  Future<VerifyOtpLoginModel> verifyOtpLogin(
    String mobileNumber,
    String otp,
  ) async {
    VerifyOtpLoginModel verifyOtpLoginModel = VerifyOtpLoginModel();

    Map<String, dynamic> dataBody = {"phone_number": mobileNumber, "otp": otp};
    try {
      http.Response response = await serviceCall(
        headers: {"Content-Type": "application/json"},
        //headers: getDefaultHeaders(5),
        url: "${ApiConstants.baseUrl}${ApiConstants.verifyOtp}",
        body: jsonEncode(dataBody),
      );
      if (response.statusCode == 201) {
        verifyOtpLoginModel = VerifyOtpLoginModel.fromJson(
          jsonDecode(response.body),
        );
        await TokenStorage.saveToken(verifyOtpLoginModel.token!);
        await TokenStorage.saveUserId(verifyOtpLoginModel.userId!);
        print(TokenStorage.getUserId());
        Future<String?> tokenStored = TokenStorage.getUserId();
        print("User id ...... $tokenStored");
      } else {
        print("object");
      }
    } catch (e) {
      print("Error : $e");
    } finally {}
    return verifyOtpLoginModel;
  }
}
