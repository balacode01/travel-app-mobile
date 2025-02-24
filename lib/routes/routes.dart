import 'package:flutter/material.dart';
import 'package:travel_app_mobile/screens/auth/register.dart';

class Routes {
  static const String signUp = './signup';
}

final Map<String, WidgetBuilder> appRoutes = {
  Routes.signUp: (context) => SignUpScreen(),
};
