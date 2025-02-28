import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: textColor)),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
