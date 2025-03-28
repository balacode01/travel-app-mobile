// To parse this JSON data, do
//
//     final verifyOtpLoginModel = verifyOtpLoginModelFromJson(jsonString);

import 'dart:convert';

VerifyOtpLoginModel verifyOtpLoginModelFromJson(String str) =>
    VerifyOtpLoginModel.fromJson(json.decode(str));

String verifyOtpLoginModelToJson(VerifyOtpLoginModel data) =>
    json.encode(data.toJson());

class VerifyOtpLoginModel {
  String? userId;
  int? statusCode;
  String? message;
  String? phoneNumber;
  String? token;

  VerifyOtpLoginModel({
    this.userId,
    this.statusCode,
    this.message,
    this.phoneNumber,
    this.token,
  });

  factory VerifyOtpLoginModel.fromJson(Map<String, dynamic> json) =>
      VerifyOtpLoginModel(
        userId: json["userId"],
        statusCode: json["statusCode"],
        message: json["message"],
        phoneNumber: json["phone_number"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "statusCode": statusCode,
    "message": message,
    "phone_number": phoneNumber,
    "token": token,
  };
}
