import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// 🌀 Infinite spin animation for any Widget
extension SpinVibes on Widget {
  Widget infiniteSpin({Duration duration = const Duration(seconds: 2)}) {
    return Animate(
      effects: [RotateEffect(duration: duration)],
      onPlay: (controller) => controller.repeat(),
      child: this,
    );
  }
}

/// 🔥 Fade in and out animation
extension FadeVibes on Widget {
  Future<Widget> fadeEffect({Duration duration = const Duration(seconds: 1)}) async {
    return Animate(
      effects: [
        FadeEffect(duration: duration),
        await Future.delayed(200.ms),
        FadeEffect(duration: duration, begin: 1, end: 0),
      ],
      child: this,
    );
  }
}

/// 🎮 Bounce on tap with animation
extension BounceTapVibes on Widget {
  Widget bounceOnTap(VoidCallback onTap) {
    return GestureDetector(
      onTapDown: (_) => onTap(),
      child: Animate(
        effects: [
          ScaleEffect(
            begin: Offset(0.1, 0.9),
            end: Offset(0, 1),
            duration: 100.ms,
            curve: Curves.easeOut,
          ),
          ScaleEffect(
            begin: Offset(0.5, 0.9),
            end: Offset(0, 1),
            duration: 100.ms,
            curve: Curves.bounceOut,
          ),
        ],
        onPlay: (controller) => controller.forward(from: 0),
        child: this,
      ),
    );
  }
}
 

/// 🚀 Slide-ins from different directions
extension SlideVibes on Widget {
  Widget slideInFromTop({Duration duration = const Duration(seconds: 1)}) {
    return Animate(
      effects: [
        MoveEffect(
          begin: const Offset(0, -100),
          end: Offset.zero,
          duration: duration,
          curve: Curves.easeOut,
        ),
        FadeEffect(duration: duration),
      ],
      child: this,
    );
  }

  Widget slideInFromBottom({Duration duration = const Duration(seconds: 1)}) {
    return Animate(
      effects: [
        MoveEffect(
          begin: const Offset(0, 100),
          end: Offset.zero,
          duration: duration,
          curve: Curves.easeOut,
        ),
        FadeEffect(duration: duration),
      ],
      child: this,
    );
  }

  Widget slideInFromLeft({Duration duration = const Duration(seconds: 1)}) {
    return Animate(
      effects: [
        MoveEffect(
          begin: const Offset(-100, 0),
          end: Offset.zero,
          duration: duration,
          curve: Curves.easeOut,
        ),
        FadeEffect(duration: duration),
      ],
      child: this,
    );
  }

  Widget slideInFromRight({Duration duration = const Duration(seconds: 1)}) {
    return Animate(
      effects: [
        MoveEffect(
          begin: const Offset(100, 0),
          end: Offset.zero,
          duration: duration,
          curve: Curves.easeOut,
        ),
        FadeEffect(duration: duration),
      ],
      child: this,
    );
  }
}
