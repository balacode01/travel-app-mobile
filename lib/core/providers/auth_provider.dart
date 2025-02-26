import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app_mobile/widgets/custom_validations.dart';
import '../api/api_service.dart';
import '../models/response_model/user_model.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  File? _profileImage;
  String? _profileImageBase64;

  File? get profileImage => _profileImage;
  String? get profileImageBase64 => _profileImageBase64;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();

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

  Future<void> registerUser() async {
    if (!validateForm()) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final requestBody = {
      "name": nameController.text,
      "email_address": emailController.text,
      "phone_number": phoneController.text,
      "profile_picture": _profileImageBase64, // Sending Base64 profile image
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
      }
    } catch (e) {
      _errorMessage = e.toString();
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
    _profileImage = null;
    _profileImageBase64 = null;
    notifyListeners();
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final String base64Image = base64Encode(await imageFile.readAsBytes());

      _profileImage = imageFile;
      _profileImageBase64 = base64Image;
      notifyListeners();
    }
  }
}
