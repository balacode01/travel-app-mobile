class GenerateOtp {
  final String message;
  final String phoneNumber;
  final String otp;
  final String expiresIn;

  GenerateOtp({
    required this.message,
    required this.phoneNumber,
    required this.otp,
    required this.expiresIn,
  });

  factory GenerateOtp.fromJson(Map<String, dynamic> json) {
    return GenerateOtp(
      message: json['message'],
      phoneNumber: json['phoneNumber'],
      otp: json['otp'],
      expiresIn: json['expiresIn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "phoneNumber": phoneNumber,
      "otp": otp,
      "expiresIn": expiresIn,
    };
  }
}
