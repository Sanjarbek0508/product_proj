import 'package:flutter/material.dart';

extension RippleExtension on Widget {
  Widget waveOnTap({
    VoidCallback? onTap,
    Color splashColor = Colors.blueAccent,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    Duration duration = const Duration(milliseconds: 300),
    Color? backgroundColor,
    List<BoxShadow>? boxShadow,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.black,
            borderRadius: borderRadius,
            boxShadow: boxShadow,
          ),
          child: InkWell(
            borderRadius: borderRadius,
            splashColor: splashColor.withOpacity(0.3),
            onTap: onTap,
            child: this,
          ),
        ),
      ),
    );
  }
}
