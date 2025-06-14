// context_extensions.dart
import 'package:flutter/material.dart';

extension KeyboardUtils on BuildContext {
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}

// usaage 

// GestureDetector(
//   onTap: () => context.hideKeyboard(),
//   child: ...
// )