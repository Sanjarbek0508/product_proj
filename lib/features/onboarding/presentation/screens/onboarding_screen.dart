import 'package:flutter/material.dart';
import 'package:product_project/core/constants/app_wrapper.dart';
import 'package:product_project/core/constants/routing.dart';
import 'package:product_project/core/constants/text_style.dart';
import 'package:product_project/features/auth/presentation/screens/login_screen.dart'; 

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppWrapper(builder: (colors) {
      return Scaffold(
        body: Expanded(
          child: GestureDetector(
            onTap: () => AppRouter.go(LoginScreen()),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.darkGreen2,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Text(
                'Homify',
                style: Manserrat.semiBold(
                  color: colors.lightGreen2,
                  size: 34,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
