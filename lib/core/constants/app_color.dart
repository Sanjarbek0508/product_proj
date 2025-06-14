import 'package:flutter/material.dart';
import 'package:product_project/core/constants/text_style.dart';

class AppTheme {
  Color get darkGreen1 => const Color(0xFF132A13); // accent / buttons
  Color get darkGreen2 => const Color(0xFF31572C); // app bar
  Color get greenMid => const Color(0xFF4F772D); // hover or medium contrast
  Color get lightGreen1 => const Color(0xFF90A955); // background highlight
  Color get lightGreen2 => const Color(0xFFECF39E); // scaffold bg
  Color get lightGreen3 => const Color.fromARGB(255, 231, 255, 223); // scaffold bg
  Color get lightGreen4 => const Color.fromARGB(255, 250, 255, 200); // scaffold bg
  Color get red => const Color.fromARGB(255, 196, 39, 0); // alerts or CTA
  Color get white => const Color(0xFFFFFFFF);
  Color get black => const Color(0xFF000000);
  Color get grey => const Color(0xFF343434);

  Color get scaffoldBackgroundColor => const Color.fromARGB(255, 238, 255, 238); // light neutral
  Color get appBarColor => const Color(0xFF1E3A34); // dark green/teal
  Color get primaryGreen => const Color(0xFF2F855A); // button/icon green
  Color get surfaceColor => const Color(0xFFEDF6F9); // card/panel bg
  Color get textPrimary => const Color(0xFF111827); // dark gray for text

  ThemeData get appThemeData => ThemeData(
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF1E3A34),
            foregroundColor: Color.fromARGB(255, 231, 255, 223),
            centerTitle: false,
            elevation: 1,
            titleTextStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 231, 255, 223),
              fontSize: 24,
            )),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF2F855A), // buttons, highlights
          onPrimary: Colors.white,
          secondary: Color(0xFFEDF6F9), // cards, secondary areas
          onSecondary: Color(0xFF111827),
          surface: Color(0xFFEDF6F9), // panel bg
          onSurface: Color(0xFF111827),
          error: Color(0xFFC62828),
          onError: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF111827)),
        ),
        useMaterial3: true,
      );
}
