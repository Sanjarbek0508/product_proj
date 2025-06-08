import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:product_project/core/constants/loading.dart';
import 'package:product_project/core/constants/routing.dart';
import 'package:product_project/core/constants/showtoast.dart';
import 'package:product_project/features/auth/presentation/blocs/bloc/auth_bloc.dart';
import 'package:product_project/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCtrl = useTextEditingController();
    final passwordCtrl = useTextEditingController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameCtrl,
          ),
          TextField(
            controller: passwordCtrl,
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                AppRouter.go(HomeScreen());
              } else if (state is AuthError) {
                ShowToast.error(context, "Errrrr");
              } else if (state is AuthLoading) {
                AppLoadingScreen();
              }
            },
            child: IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(
                      AuthLoginRequested(
                        password: passwordCtrl.text,
                        username: usernameCtrl.text,
                      ),
                    );
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
