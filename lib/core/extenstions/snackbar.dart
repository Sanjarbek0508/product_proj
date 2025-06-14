// snackbar_extensions.dart
import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnack(String message, {Color? bg = Colors.black}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bg,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
