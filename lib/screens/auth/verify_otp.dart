import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/core/utils/validations.dart';
import 'package:travel_app_mobile/widgets/custom_button.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late AuthProvider provider;

  final FocusNode _focusNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("OTP send to your number"),
                const SizedBox(height: 20),
                Pinput(
                  validator: Validator.otpValidator,
                  length: 6,
                  controller: provider.otpController,
                  focusNode: _focusNode,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue),
                    ),
                  ),
                  onCompleted: (pin) => print('Entered PIN: $pin'),
                ),
                const SizedBox(height: 16),
                CustomAnimatedButton(
                  text: 'Verify OTP',
                  onPressed: () {
                    // print("object");
                    // print(provider.otpController.text);
                    // print("object");
                    if (_formKey.currentState!.validate()) {
                      provider.verifyOtpLogin(context);
                    } else {
                      print("Something went wrong");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
