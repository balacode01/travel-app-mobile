class CustomValidations {
  static String? validateName(String value) {
    if (value.isEmpty) return "Name cannot be empty";
    if (value.length < 3) return "Name must be at least 3 characters";
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return "Email cannot be empty";
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) return "Phone number cannot be empty";
    if (value.length < 10 || value.length > 15) {
      return "Enter a valid phone number";
    }
    return null;
  }

  static String? validateBio(String value) {
    if (value.isEmpty) return "Bio cannot be empty";
    if (value.length < 10) return "Bio must be at least 10 characters";
    return null;
  }
}
