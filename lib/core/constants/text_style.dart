import 'package:flutter/material.dart';

class Manserrat {
  static TextStyle thin({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w100, style);

  static TextStyle extraLight({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w200, style);

  static TextStyle light({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w300, style);

  static TextStyle regular({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w400, style);

  static TextStyle medium({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w500, style);

  static TextStyle semiBold({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w600, style);

  static TextStyle bold({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w700, style);

  static TextStyle extraBold({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w800, style);

  static TextStyle black({
    required Color color,
    required double size,
    FontStyle? style,
  }) =>
      _base(color, size, FontWeight.w900, style);

  static TextStyle _base(
    Color color,
    double size,
    FontWeight weight,
    FontStyle? style,
  ) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: size,
      color: color,
      fontWeight: weight,
      fontStyle: style ?? FontStyle.normal,
    );
  }
}
