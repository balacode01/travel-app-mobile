import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/widgets/custom_bottomsheet.dart';
import '../../core/providers/auth_provider.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.grey[300],
          backgroundImage:
              authProvider.profileImage != null
                  ? FileImage(authProvider.profileImage!)
                  : null,
          child:
              authProvider.profileImage == null
                  ? const Icon(Icons.person, size: 40, color: Colors.white)
                  : null,
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: GestureDetector(
            onTap: () => _showImagePicker(context),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black,
              child: const Icon(Icons.edit, color: Colors.white, size: 18),
            ),
          ),
        ),
      ],
    );
  }

  void _showImagePicker(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // showModalBottomSheet(
    //   context: context,
    //   builder: (context) {
    //     return Wrap(
    //       children: [
    //         ListTile(
    //           leading: const Icon(Icons.camera_alt),
    //           title: const Text("Take Photo"),
    //           onTap: () {
    //             authProvider.pickImage(ImageSource.camera);
    //             Navigator.pop(context);
    //           },
    //         ),
    //         ListTile(
    //           leading: const Icon(Icons.photo_library),
    //           title: const Text("Choose from Gallery"),
    //           onTap: () {
    //             authProvider.pickImage(ImageSource.gallery);
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ],
    //     );
    //   },
    // );

    CustomBottomSheet.show(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text("Take a Photo"),
            onTap: () {
              authProvider.pickImage(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text("Choose from Gallery"),
            onTap: () {
              authProvider.pickImage(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
