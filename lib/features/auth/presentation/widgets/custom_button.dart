import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.function,
    this.padding,
    this.margin,
    this.hei,
    this.wid,
  });

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? wid;
  final double? hei;
  final Widget child;
  final Color backgroundColor;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        margin: margin,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x000000).withValues(
                alpha: 0.1,
              ),
              offset: Offset(4, 5),
              blurRadius: 9,
              spreadRadius: -4,
            )
          ],
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        width: wid ?? 230,
        height: hei ?? 64,
        padding: padding,
        child: child,
      ),
    );
  }
}
