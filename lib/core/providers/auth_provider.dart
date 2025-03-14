// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app_mobile/core/models/response_model/otp_model.dart';
import 'package:travel_app_mobile/core/models/response_model/verify_otp_model.dart';
import 'package:travel_app_mobile/core/rest/auth_rest.dart';
import 'package:travel_app_mobile/screens/auth/verify_otp.dart';
import 'package:travel_app_mobile/screens/home/home_page.dart';
import 'package:travel_app_mobile/widgets/custom_validations.dart';
import '../api/api_service.dart';
import '../models/response_model/user_model.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  final AuthRest _authRest = AuthRest();

  UserModel? _user;
  GenerateOtpResponse? _userPhoneNumber;
  VerifyOtpLoginModel? _verifyOtpLoginModel;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  File? profileImage;
  String? profileImageBase64;

  File? get profileImages => profileImage;
  String? get profileImageBase64s => profileImageBase64;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();

  /// login provider
  final TextEditingController phoneNumberController = TextEditingController();

  // otp provider
  final TextEditingController otpController = TextEditingController();

  bool validateForm() {
    final nameError = CustomValidations.validateName(nameController.text);
    final emailError = CustomValidations.validateEmail(emailController.text);
    final phoneError = CustomValidations.validatePhone(phoneController.text);
    final bioError = CustomValidations.validateBio(bioController.text);

    if (nameError != null ||
        emailError != null ||
        phoneError != null ||
        bioError != null) {
      _errorMessage = nameError ?? emailError ?? phoneError ?? bioError;
      notifyListeners();
      return false;
    }
    return true;
  }

  final ImagePicker _picker = ImagePicker();
  String? shortImageLength;
  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      profileImage = imageFile;
      profileImageBase64 = base64Image;
      shortImageLength = profileImageBase64;
      notifyListeners();
    }
  }

  Future<void> registerUser() async {
    if (!validateForm()) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    final requestBody = {
      "name": nameController.text,
      "email_address": emailController.text,
      "phone_number": phoneController.text,
      "profile_picture": shortImageLength, // Sending Base64 profile image
      "bio": bioController.text,
      "social_links": {
        "instagram": instagramController.text,
        "youtube": youtubeController.text,
      },
    };

    try {
      _user = await _apiService.registerUser(requestBody);
      if (_user != null) {
        clearFields();
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// login app
  Future<void> submitPhoneNumber(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    final String phoneNumber = phoneNumberController.text.trim();
    try {
      _userPhoneNumber = await _authRest.loginWithOtp(phoneNumber);
      if (_userPhoneNumber!.otp!.isNotEmpty) {
        print("Logged in successfully");
        print(_userPhoneNumber!.otp);
        print("Logged in successfully");
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => VerifyOtpPage()));
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Verify Otp
  Future<String?> verifyOtpLogin(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      _verifyOtpLoginModel = await _authRest.verifyOtpLogin(
        phoneNumberController.text.trim(),
        otpController.text.trim(),
      );
      if (_verifyOtpLoginModel!.statusCode == 201) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false, // Remove all previous routes
        );
        return null;
      } else {
        return "Invalid OTP. Try again";
      }
    } catch (e) {
      return "Something went wrong. Please try again";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    bioController.clear();
    instagramController.clear();
    youtubeController.clear();
    profileImage = null;
    profileImageBase64 = null;
    notifyListeners();
  }
}
