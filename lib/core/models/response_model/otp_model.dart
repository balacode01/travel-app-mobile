import 'dart:convert';

GenerateOtpResponse generateOtpResponseFromJson(String str) =>
    GenerateOtpResponse.fromJson(json.decode(str));

String generateOtpResponseToJson(GenerateOtpResponse data) =>
    json.encode(data.toJson());

class GenerateOtpResponse extends BaseStatus {
  GenerateOtpResponse({
    this.message,
    this.phoneNumber,
    this.otp,
    this.expiresIn,
  });

  String? message;
  String? phoneNumber;
  String? otp;
  DateTime? expiresIn;

  factory GenerateOtpResponse.fromJson(Map<String, dynamic> json) =>
      GenerateOtpResponse(
        message: json["message"],
        phoneNumber: json["phone_number"],
        otp: json["otp"],
        expiresIn:
            json["expiresIn"] != null
                ? DateTime.parse(json["expiresIn"])
                : null,
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "phone_number": phoneNumber,
    "otp": otp,
    "expiresIn": expiresIn?.toIso8601String(),
  };
}

class BaseStatus {
  int? statusCode;

  BaseStatus({this.statusCode});
}
