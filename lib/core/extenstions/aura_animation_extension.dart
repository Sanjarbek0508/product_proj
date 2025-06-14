import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

/// ✨ Animate any widget with chainable vibes
extension WidgetVibes on Widget {
  /// Basic entrance combo
  Widget vibeAnimate() {
    return animate()
        .fadeIn(duration: 300.ms)
        .scale(begin: Offset(0.1, 0.9))
        .then(delay: 200.ms)
        .shake()
        .slideY(begin: 0.3)
        .move(duration: 600.ms);
  }

  /// Add custom delay before showing
  Widget withDelay(Duration delay) {
    return FutureBuilder(
      future: Future.delayed(delay),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) return this;
        return const SizedBox.shrink();
      },
    );
  }

  /// Neon glow effect 🌈
  Widget neonGlow({
    Color color = Colors.cyanAccent,
    double blur = 18,
    double spread = 1.5,
  }) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: color, blurRadius: blur, spreadRadius: spread),
        ],
      ),
      child: this,
    );
  }

  /// Bounce on tap 🎮
  Widget onTapBounce(VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: 1),
        duration: 200.ms,
        builder: (_, scale, child) {
          return AnimatedScale(
            scale: scale,
            duration: 200.ms,
            child: this,
          );
        },
      ),
    );
  }

  /// Infinite spin 🌀
  Widget infiniteSpin({Duration duration = const Duration(seconds: 2)}) {
    return _LoopAnimation(
      duration: duration,
      builder: (context, animation) => RotationTransition(
        turns: animation,
        child: this,
      ),
    );
  }

  /// Infinite fade/pulse 🔁
  Widget infinitePulse({Duration duration = const Duration(seconds: 2)}) {
    return _LoopAnimation(
      duration: duration,
      builder: (context, animation) => FadeTransition(
        opacity: animation,
        child: this,
      ),
    );
  }
}

class _LoopAnimation extends StatefulWidget {
  final Widget Function(BuildContext, Animation<double>) builder;
  final Duration duration;

  const _LoopAnimation({
    required this.builder,
    required this.duration,
  });

  @override
  State<_LoopAnimation> createState() => _LoopAnimationState();
}

class _LoopAnimationState extends State<_LoopAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) => widget.builder(context, _animation);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// 🔤 Typewriter effect for raw strings
extension TypewriterText on String {
  Widget typewriter({
    TextStyle? style,
    Duration speed = const Duration(milliseconds: 60),
  }) {
    return _Typewriter(text: this, style: style, speed: speed);
  }

  /// Uses animated_text_kit for vibey one-liners 🔥
  Widget animatedKit({
    TextStyle? style,
    Duration speed = const Duration(milliseconds: 70),
  }) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(this, textStyle: style, speed: speed),
      ],
      isRepeatingAnimation: false,
    );
  }
}

class _Typewriter extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration speed;

  const _Typewriter({required this.text, this.style, required this.speed});

  @override
  State<_Typewriter> createState() => _TypewriterState();
}

class _TypewriterState extends State<_Typewriter> {
  String _displayedText = '';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  Future<void> _startTyping() async {
    while (_currentIndex < widget.text.length) {
      await Future.delayed(widget.speed);
      setState(() {
        _currentIndex++;
        _displayedText = widget.text.substring(0, _currentIndex);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_displayedText, style: widget.style);
  }
}
