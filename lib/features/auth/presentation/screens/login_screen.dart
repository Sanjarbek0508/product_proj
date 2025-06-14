import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:product_project/core/constants/app_wrapper.dart';
import 'package:product_project/core/constants/routing.dart';
import 'package:product_project/core/constants/text_style.dart';
import 'package:product_project/features/auth/presentation/widgets/custom_button.dart';
import 'package:product_project/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:product_project/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCtrl = useTextEditingController();
    final passwordCtrl = useTextEditingController();
    return AppWrapper(builder: (colors) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(top: 140),
                child: Text(
                  'Welcome to \nHomify.',
                  style: Manserrat.black(color: colors.black, size: 48),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: CustomTextfield(
                          prefixIcon: Icon(
                            Icons.person,
                            color: colors.darkGreen1,
                            size: 22,
                          ),
                          backgroundColor: colors.lightGreen3,
                          controller: usernameCtrl,
                          colors: colors,
                          hint: 'Enter username',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 300,
                    child: CustomTextfield(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: colors.darkGreen1,
                        size: 22,
                      ),
                      backgroundColor: colors.lightGreen3,
                      controller: passwordCtrl,
                      colors: colors,
                      hint: 'Enter password',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 14),
                            children: [
                              TextSpan(
                                text: 'Forgot your password? ',
                                style: Manserrat.medium(color: colors.grey, size: 14),
                              ),
                              TextSpan(
                                text: 'Reset here',
                                style: Manserrat.bold(color: colors.grey, size: 14),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Reset tapped!');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            CustomButton(
                margin: EdgeInsets.only(bottom: 35),
                wid: 300,
                hei: 56,
                backgroundColor: colors.darkGreen1,
                function: () => AppRouter.open(
                      HomeScreen(),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      style: Manserrat.bold(
                        color: colors.scaffoldBackgroundColor,
                        size: 17,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      );
    });
  }
}
