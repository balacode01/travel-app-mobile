import 'dart:convert';

class VerifyOtp {
  final String message;
  final String phoneNumber;
  final String token;

  VerifyOtp({
    required this.message,
    required this.phoneNumber,
    required this.token,
  });

  factory VerifyOtp.fromJson(Map<String, dynamic> json) {
    return VerifyOtp(
      message: json["message"],
      phoneNumber: json["phoneNumber"],
      token: json["token"],
    );
  }
  Map<String, dynamic> toJson() {
    return {"message": message, "phoneNumber": phoneNumber, "token": token};
  }
}
