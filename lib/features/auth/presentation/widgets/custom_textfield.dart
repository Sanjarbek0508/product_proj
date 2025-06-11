import 'package:flutter/material.dart';
import 'package:product_project/core/constants/app_color.dart';
import 'package:product_project/core/constants/text_style.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.colors,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.maxlines = 1,
    this.readOnly = false,
    required this.hint,
    required this.backgroundColor,
    this.prefixWidget,
    this.suffixWidget,
  });
  final TextEditingController controller;
  final AppTheme colors;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Color backgroundColor;
  final Widget? suffixIcon;
  final Function(String e)? onChanged;
  final Function(String e)? onSubmitted;
  final Function()? onTap;
  final int? maxlines;
  final bool? readOnly;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      style: Manserrat.medium(
        color: colors.black,
        size: 16,
      ),
      onTap: onTap,
      maxLines: maxlines,
      readOnly: readOnly!,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: Manserrat.light(
          color: colors.grey,
          size: 14,
        ),
        labelStyle: Manserrat.light(
          color: colors.grey,
          size: 14,
        ),
        alignLabelWithHint: true,
        label: Text(hint),
        hintText: hint,
        filled: true,
        fillColor: backgroundColor,
        suffix: suffixWidget,
        prefix: prefixWidget,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colors.darkGreen1,
            width: 0.2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colors.darkGreen1,
            width: 0.2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colors.darkGreen1,
            width: 0.4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colors.darkGreen1,
            width: 0.6,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colors.red,
            width: 0.8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: colors.red,
            width: 0.8,
          ),
        ),
      ),
    );
  }
}
