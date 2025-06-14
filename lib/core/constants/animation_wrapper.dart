import 'package:flutter/material.dart';

class AnimatedWrapper extends StatefulWidget {
  final Widget Function(BuildContext context, Animation<double> animation) builder;
  final Duration duration;
  final Curve curve;

  const AnimatedWrapper({
    required this.builder,
    required this.duration,
    required this.curve,
  });

  @override
  State<AnimatedWrapper> createState() => AnimatedWrapperState();
}

class AnimatedWrapperState extends State<AnimatedWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _animation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
