part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final String accessToken;
  final String refreshToken;

  AuthSuccess({required this.accessToken, required this.refreshToken});
}

final class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
