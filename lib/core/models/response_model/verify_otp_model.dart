// To parse this JSON data, do
//
//     final verifyOtpLogin = verifyOtpLoginFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:travel_app_mobile/core/models/response_model/otp_model.dart';

VerifyOtpLoginModel VerifyOtpLoginModelFromJson(String str) =>
    VerifyOtpLoginModel.fromJson(json.decode(str));

String VerifyOtpLoginModelToJson(VerifyOtpLoginModel data) =>
    json.encode(data.toJson());

class VerifyOtpLoginModel extends BaseStatus {
  VerifyOtpLoginModel({
    this.message,
    this.phoneNumber,
    this.token,
    this.statusCode,
  });
  String? message;
  String? phoneNumber;
  String? token;
  int? statusCode;

  factory VerifyOtpLoginModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpLoginModel(
        message: json["message"],
        phoneNumber: json["phone_number"],
        token: json["token"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "phone_number": phoneNumber,
    "token": token,
    "statusCode": statusCode,
  };
}

class BaseStatus {
  int? statusCode;

  BaseStatus({this.statusCode});
}
