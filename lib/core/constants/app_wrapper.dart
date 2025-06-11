import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:product_project/core/constants/app_color.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({
    super.key,
    required this.builder, 
  });

  final Widget Function(AppTheme colors) builder; 

  @override
  Widget build(BuildContext context) {
    return builder(AppTheme());
  }
}
