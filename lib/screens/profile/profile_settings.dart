import 'package:flutter/material.dart';
import 'package:travel_app_mobile/core/utils/token_storage.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await TokenStorage.deleteToken();
          },
          child: Text("Logout"),
        ),
      ),
    );
  }
}
