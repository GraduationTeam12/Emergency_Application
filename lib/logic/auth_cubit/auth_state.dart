part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class Loading extends AuthState {}

final class ErrorOccured extends AuthState {
  final String errMsg;

  ErrorOccured({required this.errMsg});
}

final class SuccessfullyLogin extends AuthState {}
