import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder:
          (context) =>
              Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}
