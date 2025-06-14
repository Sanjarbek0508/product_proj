import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_project/core/constants/app_wrapper.dart';
import 'package:product_project/core/constants/responsivness.dart';
import 'package:product_project/core/constants/routing.dart';
import 'package:product_project/core/constants/showtoast.dart';
import 'package:product_project/features/auth/data/repositories/auth_repository.dart';
import 'package:product_project/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:product_project/features/home/presentation/screens/home_screen.dart';
import 'package:product_project/features/onboarding/presentation/screens/onboarding_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);

    return AppWrapper(builder: (colors) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              repository: AuthRepository(),
            ),
          )
        ],
        child: MaterialApp(
          theme: colors.appThemeData,
          navigatorKey: AppRouter.navigatorKey,
          debugShowCheckedModeBanner: false,
          home: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                AppRouter.go(HomeScreen());
              } else if (state is AuthError) {
                ShowToast.error(context, "Login failed");
              }
            },
            child: OnboardingScreen(),
          ),
        ),
      );
    });
  }
}
