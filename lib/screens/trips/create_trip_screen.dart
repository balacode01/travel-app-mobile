import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/trip_provider.dart';
import 'package:travel_app_mobile/widgets/custom_button.dart';
import 'package:travel_app_mobile/widgets/custom_textfield.dart';
import 'dart:io';

class CreateTripScreen extends StatefulWidget {
  const CreateTripScreen({super.key});

  @override
  State<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends State<CreateTripScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create New Trip")),
      body: Consumer<TripProvider>(
        builder: (context, tripProvider, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("Let the world know what you discovered"),
                  const SizedBox(height: 10),

                  /// **Cover Image Picker**
                  GestureDetector(
                    onTap:
                        () => tripProvider.showImageSourceActionSheet(context),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black54),
                      ),
                      child:
                          tripProvider.coverImage == null
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt,
                                      size: 50,
                                      color: Colors.black54,
                                    ),
                                    Text("Add Cover Image"),
                                  ],
                                ),
                              )
                              : ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  File(tripProvider.coverImage!.path),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 180,
                                ),
                              ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  CustomTextField(
                    controller: tripProvider.tripNameController,
                    label: "Trip Title",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: tripProvider.descriptionController,
                    label: "Description",
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: tripProvider.locationController,
                    label: "Location",
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: CustomTextField(
                          onTap:
                              () => tripProvider.selectDate(
                                context,
                                tripProvider.fromDateController,
                              ),
                          controller: tripProvider.fromDateController,
                          label: "From Date",
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: CustomTextField(
                          readOnly: true,
                          onTap:
                              () => tripProvider.selectDate(
                                context,
                                tripProvider.toDateController,
                              ),
                          controller: tripProvider.toDateController,
                          label: "To Date",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: tripProvider.totalBudgetController,
                    label: "Total Budget",
                  ),
                  const SizedBox(height: 10),
                  CustomAnimatedButton(
                    text: 'Publish Trip',
                    onPressed: () => tripProvider.createTrip(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
