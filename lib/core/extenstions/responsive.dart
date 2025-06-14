import 'package:flutter/material.dart';

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

  Widget get wb => SizedBox(width: toDouble().w);
  Widget get hb => SizedBox(height: toDouble().h);
  Widget get shb => SliverToBoxAdapter(child: SizedBox(height: toDouble().h));
  Widget get swb => SliverToBoxAdapter(child: SizedBox(width: toDouble().w));
}

// DONT FORGET TO INITALIZE THE INIT INSIDE OF THE MAIN RUNAPP USING BUILDER

class AppResponsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
  }

  static double height(double number) => (number / 1024) * screenHeight;

  static double width(double number) => (number / 1440) * screenWidth;
}

// FOR TEXT SIZES

extension TextSizeExt on num {
  double get sp => (toDouble() / 1024) * AppResponsive.screenHeight;
}

// PADDING

extension AppPaddingAndRadius on num {
  EdgeInsets get p => EdgeInsets.all(toDouble());
  EdgeInsets get ph => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get pv => EdgeInsets.symmetric(vertical: toDouble());
  EdgeInsets get hV =>
      EdgeInsets.symmetric(vertical: toDouble(), horizontal: toDouble());
  EdgeInsets get right => EdgeInsets.only(right: toDouble());
  EdgeInsets get top => EdgeInsets.only(top: toDouble());
  EdgeInsets get left => EdgeInsets.only(left: toDouble());
  EdgeInsets get bottom => EdgeInsets.only(bottom: toDouble());

  BorderRadius get r => BorderRadius.circular(toDouble().w);
}

extension WidgetX on Widget {
  Widget visible(bool condition) => condition ? this : const SizedBox.shrink();
  Widget paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);
}

extension DividerX on double {
  Widget get divider => Divider(thickness: this);
}

extension ColorExt on Color {
  // Opacity shortcut: 0-100 scale
  Color opacity(double percent) => withOpacity(percent / 100);

  // Lighter color (10% lighter)
  Color get lighten => _adjust(0.1);

  // Darker color (10% darker)
  Color get darken => _adjust(-0.1);

  // Adjust color brightness
  Color _adjust(double amount) {
    final hsl = HSLColor.fromColor(this);
    final lightness = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(lightness).toColor();
  }

  // Convert to a custom hex
  static Color fromHex(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  // Get the complementary color (opposite on the color wheel)
  Color get complementary {
    final hsl = HSLColor.fromColor(this);
    final h = (hsl.hue + 180) % 360;
    return hsl.withHue(h).toColor();
  }
}
