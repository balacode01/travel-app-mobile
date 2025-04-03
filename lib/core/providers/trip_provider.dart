// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:travel_app_mobile/core/models/response_model/trips/create_trip_model.dart';
import 'package:travel_app_mobile/core/rest/trip_rest.dart';

class TripProvider extends ChangeNotifier {
  TripRest tripRest = TripRest();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // Create trip controllers
  TextEditingController tripNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController totalBudgetController = TextEditingController();

  File? coverImage;
  String? coverImageString;

  /// **Function to pick an image from Camera or Gallery**
  Future<void> pickImage(ImageSource source, BuildContext context) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        coverImage = File(pickedFile.path);
        // Future<String> convertFileToBase64(File imageFile) async {
        //   List<int> imageBytes = await imageFile.readAsBytes();
        //   return base64Encode(imageBytes);
        // }
        List<int> imageBytes = await coverImage!.readAsBytes();
        coverImageString = base64Encode(imageBytes);
        print(coverImageString);
        print("cover image string");
        notifyListeners();
      }
    } catch (e) {
      // Show error message if image picking fails
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to pick image: $e")));
    }
  }

  /// **Show Image Source Selection**
  void showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera, context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Choose from Gallery'),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery, context);
              },
            ),
          ],
        );
      },
    );
  }

  // * method to show date picker * //
  Future<void> selectDate(
    BuildContext context,
    TextEditingController controller,
  ) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      controller.text = formattedDate;
    }
    notifyListeners();
  }

  //* create trip API *//
  Future<void> createTrip() async {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      "user_id": 1,
      "name": tripNameController.text,
      "from_date": fromDateController.text,
      "to_date": toDateController.text,
      "description": descriptionController.text,
      "total_budget": totalBudgetController.text,
      "cover_image": coverImageString,
    };
    print(data);

    CreateTripModelResponse createTripModelResponse = CreateTripModelResponse();
    createTripModelResponse = await tripRest.createTripRest(data);
    try {
      if (createTripModelResponse.statusCode == 201) {
        print("trip saved");
      } else {
        print("Trip did not saved");
      }
    } catch (e) {}
  }
}
