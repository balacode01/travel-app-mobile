import 'dart:io';

import 'package:flutter/material.dart';
import '../api/api_service.dart';
import '../models/response_model/user_model.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  File? _profileImage;

  File? get profileImage => _profileImage;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController profileController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();

  Future<void> registerUser() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final requestBody = {
      "name": nameController.text,
      "email_address": emailController.text,
      "phone_number": phoneController.text,
      "profile_picture": profileController.text,
      "bio": bioController.text,
      "social_links": {
        "instagram": instagramController.text,
        "youtube": youtubeController.text,
      },
    };
    try {
      _user = await _apiService.registerUser(requestBody);
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
    profileController.clear();
    instagramController.clear();
    youtubeController.clear();
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  /// Upload profile picture (Replace this with actual API upload)
  Future<void> uploadProfilePicture() async {
    if (_profileImage == null) return;

    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }

  /// generate otp code
}
