import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/screens/auth/verify_otp.dart';
import 'package:travel_app_mobile/widgets/custom_button.dart';
import 'package:travel_app_mobile/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: provider.otpController,
                label: "Phone number",
              ),
              const SizedBox(height: 16),
              CustomAnimatedButton(
                text: 'Submit',
                onPressed: () async {
                  // Navigator.of(
                  //   context,
                  // ).push(MaterialPageRoute(builder: (_) => VerifyOtpPage()));
                  provider.generateOtpLogin(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
