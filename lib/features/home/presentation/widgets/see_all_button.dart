import 'package:flutter/material.dart';
import 'package:product_project/core/constants/app_color.dart';
import 'package:product_project/core/constants/responsivness.dart';
import 'package:product_project/core/constants/text_style.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({
    super.key,
    required this.colors,
    required this.func,
  });

  final AppTheme colors;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: SizedBox(
        width: appW(80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'View all',
              style: Manserrat.medium(
                style: FontStyle.italic,
                color: colors.darkGreen1,
                size: appW(14),
              ),
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: colors.darkGreen1,
              size: appW(18),
            )
          ],
        ),
      ),
    );
  }
}
