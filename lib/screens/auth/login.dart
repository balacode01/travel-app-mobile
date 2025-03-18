import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app_mobile/core/providers/auth_provider.dart';
import 'package:travel_app_mobile/core/utils/validations.dart';
import 'package:travel_app_mobile/widgets/custom_button.dart';
import 'package:travel_app_mobile/widgets/custom_snackbar.dart';
import 'package:travel_app_mobile/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthProvider provider;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<AuthProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  validator: Validator.validatePhoneNumber,
                  controller: provider.phoneNumberController,
                  label: "Phone number",
                  onChanged: (value) {},
                ),
                const SizedBox(height: 16),
                CustomAnimatedButton(
                  text: 'Submit',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      provider.submitPhoneNumber(context);
                    } else {
                      CustomSnackbar.show(
                        context,
                        message: "Invalid details. Try again!",
                      );
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
