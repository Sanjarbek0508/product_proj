import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_project/core/constants/routing.dart';
import 'package:product_project/core/services/token_storage.dart';
import 'package:product_project/features/auth/data/repositories/auth_repository.dart';
import 'package:product_project/features/home/presentation/screens/home_screen.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());

      try {
        final tokens = await repository.login({
          "username": event.username,
          "password": event.password,
        });

        log(tokens.toString());

        await TokenStorage.saveTokens(
          tokens['accessToken']!,
          tokens['refreshToken']!,
        );

        emit(
          AuthSuccess(
            accessToken: tokens['accessToken']!,
            refreshToken: tokens['refreshToken']!,
          ),
        );

        log(event.password);
        log(event.username);

        log('Success');
      } catch (e) {
        emit(
          AuthError(
            message: e.toString(),
          ),
        );
      }
    });
    on<AuthLogoutRequested>(
      (event, emit) async {
        await TokenStorage.clearTokens();
        emit(
          AuthInitial(),
        );
      },
    );
  }
}
