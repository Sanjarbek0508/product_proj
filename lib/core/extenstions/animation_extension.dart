import 'package:flutter/material.dart';
import 'package:product_project/core/constants/animation_wrapper.dart';



extension WidgetAnimationExtension on Widget {
  /// Fade in animation
  Widget fadeIn({Duration duration = const Duration(milliseconds: 500), Curve curve = Curves.easeIn}) {
    return AnimatedWrapper(
      duration: duration,
      curve: curve,
      builder: (context, animation) => FadeTransition(opacity: animation, child: this),
    );
  }

  /// Scale in animation
  Widget scaleIn({Duration duration = const Duration(milliseconds: 500), Curve curve = Curves.easeOutBack}) {
    return AnimatedWrapper(
      duration: duration,
      curve: curve,
      builder: (context, animation) => ScaleTransition(scale: animation, child: this),
    );
  }

  /// Slide in from bottom
  Widget slideInFromBottom({
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeOut,
    double offsetY = 30,
  }) {
    return AnimatedWrapper(
      duration: duration,
      curve: curve,
      builder: (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, offsetY / 100),
          end: Offset.zero,
        ).animate(animation),
        child: this,
      ),
    );
  }

  /// Bounce In
  Widget bounceIn({
    Duration duration = const Duration(milliseconds: 600),
  }) {
    return scaleIn(duration: duration, curve: Curves.elasticOut);
  }
}
