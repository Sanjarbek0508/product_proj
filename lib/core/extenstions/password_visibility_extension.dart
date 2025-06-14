// password_visibility_extension.dart
import 'package:flutter/material.dart';

extension PasswordToggle on Widget {
  Widget withVisibilityToggle({required bool obscure, required VoidCallback onPressed}) {
    return Row(
      children: [
        Expanded(child: this),
        IconButton(
          icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
          onPressed: onPressed,
        ),
      ],
    );
  }
}

// usage
// bool obscure = true;

// TextField(
//   obscureText: obscure,
// ).withVisibilityToggle(
//   obscure: obscure,
//   onPressed: () {
//     setState(() => obscure = !obscure);
//   },
// )
