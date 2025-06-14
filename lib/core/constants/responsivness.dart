import 'package:flutter/material.dart';

class AppResponsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 844) * screenHeight;

  static double width(double number) => (number / 390) * screenWidth;
}

double appW(double width) {
  return AppResponsive.width(width);
}

double appH(double height) {
  return AppResponsive.height(height);
}

extension AppSizerExtension on num {
  double get w {
    return appW(toDouble());
  }

  double get h {
    return appH(toDouble());
  }

  Widget get wBox => SizedBox(
        width: toDouble().w,
      );
  Widget get hBox => SizedBox(
        height: toDouble().h,
      );
}
