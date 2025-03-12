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

  printData() {
    print(nameController.text);
    print(emailController.text);
    print(phoneController.text);
    print(bioController.text);
    print(profileImageBase64s);
  }

  bool validateForm() {
    // print(nameController.text);
    // print(emailController.text);
    // print(phoneController.text);
    // print(bioController.text);
    // print(profileImageBase64);
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
      // print("name = $nameError");
      // print("email = $emailError");
      // print("phone =  $phoneError");
      // print("bio = $bioError");
      // print("profile picture = $profileImageBase64s");
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
      //print("ImageFile = $imageFile");
      List<int> imageBytes = await imageFile.readAsBytes();
      //print("imageBytes = $imageBytes");
      String base64Image = base64Encode(imageBytes);
      //print("Image = $image");
      profileImage = imageFile;
      //print("Profile image $profileImage");
      profileImageBase64 = base64Image;
      shortImageLength = profileImageBase64;
      //print("profileImageBase64 = $profileImageBase64");
      notifyListeners();
    }
  }

  Future<void> registerUser() async {
    if (!validateForm()) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // print("profile image ;;;;;; $profileImageBase64");

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

    // print("request body: $requestBody");

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
