class UserPhoneNumber {
  final String? phoneNumber;

  UserPhoneNumber({required this.phoneNumber});

  /// Convert JSON to Model
  factory UserPhoneNumber.fromJson(Map<String, dynamic> json) {
    return UserPhoneNumber(phoneNumber: json['phone_number']);
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {'phone_number': phoneNumber};
  }
}
