// animated_extensions.dart
import 'package:flutter/material.dart';

extension AnimatedToggle on Widget {
  Widget animatedVisibility(bool visible, {Duration duration = const Duration(milliseconds: 300)}) {
    return AnimatedSwitcher(
      duration: duration,
      child: visible ? this : const SizedBox.shrink(),
    );
  }
}
