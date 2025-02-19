import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../core/providers/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _chooseProfilePicture(context),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                    provider.profileImage != null
                        ? FileImage(provider.profileImage!)
                        : null,
                child:
                    provider.profileImage == null
                        ? const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        )
                        : null,
              ),
            ),
            TextField(
              controller: provider.nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: provider.emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: provider.phoneController,
              decoration: const InputDecoration(labelText: "Phone Number"),
            ),
            TextField(
              controller: provider.bioController,
              decoration: const InputDecoration(labelText: "Bio"),
            ),
            TextField(
              controller: provider.instagramController,
              decoration: const InputDecoration(labelText: "Instagram URL"),
            ),
            TextField(
              controller: provider.youtubeController,
              decoration: const InputDecoration(labelText: "YouTube URL"),
            ),
            const SizedBox(height: 20),
            provider.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: () => provider.registerUser(),
                  child: const Text("Register"),
                ),
            if (provider.errorMessage != null)
              Text(
                "Error: ${provider.errorMessage}",
                style: const TextStyle(color: Colors.red),
              ),
            if (provider.user != null)
              Text(
                "User Registered: ${provider.user!.name}",
                style: const TextStyle(color: Colors.green),
              ),
          ],
        ),
      ),
    );
  }

  void _chooseProfilePicture(BuildContext context) {
    final provider = context.read<AuthProvider>();

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
