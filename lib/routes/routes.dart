import 'package:flutter/material.dart';
import 'package:travel_app_mobile/screens/auth/login.dart';
import 'package:travel_app_mobile/screens/auth/register.dart';
import 'package:travel_app_mobile/screens/auth/verify_otp.dart';
import 'package:travel_app_mobile/screens/home/home_page.dart';

class Routes {
  static const String login = './login';
  static const String signUp = './signup';
  static const String verifyOtp = './verifyOtp';
  static const String homePage = './homePage';
}

final Map<String, WidgetBuilder> appRoutes = {
  Routes.login: (context) => LoginPage(),
  Routes.signUp: (context) => SignUpScreen(),
  Routes.verifyOtp: (context) => VerifyOtpPage(),
  Routes.homePage: (context) => HomePage(),
};
