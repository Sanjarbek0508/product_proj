import 'dart:math';

import 'package:flutter/material.dart';

extension ResponsiveSizes on BuildContext {
  static const double _baseWidth = 1440;
  static const double _baseHeight = 1024;
  static const double _baseDiagonal = 1766.99; 

  double h(double real) {
    final screenHeight = MediaQuery.of(this).size.height;
    return (real / _baseHeight) * screenHeight;
  }

  double w(double real) {
    final screenWidth = MediaQuery.of(this).size.width;
    return (real / _baseWidth) * screenWidth;
  }

  double s(double real) {
    final size = MediaQuery.of(this).size;
    final diagonal = sqrt(size.width * size.width + size.height * size.height);
    return (real / _baseDiagonal) * diagonal;
  }

 
}