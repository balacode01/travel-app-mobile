import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/widgets/custom_button.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late AuthProvider provider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<AuthProvider>(context, listen: false); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("OTP send to your number"),
              const SizedBox(height: 20),
              Pinput(
                controller: provider.otpController,
                enabled: true,
                keyboardType: TextInputType.number,
                length: 6,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              CustomAnimatedButton(text: 'Verify OTP', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
