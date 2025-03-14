class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  /// mobile number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone is missing or invalid";
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return "Only Numbers are allowed";
    }
    if (value.length != 10) {
      return "Phone must be 10 digits only";
    }
    return null;
  }

  // otp validation
  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "OTP cannot be empty";
    }
    if (value.length != 6) {
      return "OTP should be 6 digits";
    }
    return null;
  }
}
