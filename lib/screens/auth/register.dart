import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/widgets/custom_button.dart';
import 'package:travel_app_mobile/widgets/custom_profile_picture.dart';
import 'package:travel_app_mobile/widgets/custom_snackbar.dart';
import 'package:travel_app_mobile/widgets/custom_textfield.dart';
import '../../core/providers/auth_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<AuthProvider>(
      context,
      listen: false,
    ); // ✅ Get provider instance
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfilePicture(),
            CustomTextField(controller: provider.nameController, label: 'Name'),
            CustomTextField(
              controller: provider.emailController,
              label: 'Email',
            ),
            CustomTextField(
              controller: provider.phoneController,
              label: "Phone number",
            ),
            CustomTextField(
              controller: provider.bioController,
              label: "Bio",
              maxLines: 3,
            ),
            CustomTextField(
              controller: provider.instagramController,
              label: "Instagram Link",
            ),
            CustomTextField(
              controller: provider.youtubeController,
              label: "Youtube Link",
            ),
            const SizedBox(height: 20),

            Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? const CircularProgressIndicator()
                    : CustomAnimatedButton(
                      text: "Continue",
                      isLoading: provider.isLoading,
                      onPressed: () {
                        //provider.printData();
                        if (provider.validateForm()) {
                          provider.registerUser();
                        } else {
                          CustomSnackbar.show(
                            context,
                            message: 'Missings Fields',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      },
                    );
              },
            ),
            // provider.errorMessage != null
            //     ? Text(
            //       "Error: ${provider.errorMessage}",
            //       style: const TextStyle(color: Colors.red),
            //     )
            //     : SizedBox(),
            // if (provider.user != null)
            //   Text(
            //     "User Registered: ${provider.user!.name}",
            //     style: const TextStyle(color: Colors.green),
            //   ),
          ],
        ),
      ),
    );
  }

  void _chooseProfilePicture() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Take photo"),
              onTap: () {
                provider.pickImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text("Choose from Gallery"),
              onTap: () {
                provider.pickImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
