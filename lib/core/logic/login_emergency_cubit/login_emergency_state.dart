part of 'login_emergency_cubit.dart';

@immutable
sealed class LoginEmergencyState {}

final class LoginEmergencyInitial extends LoginEmergencyState {}

final class LoginLoadingEmergencyState extends LoginEmergencyState {}

final class LoginSuccessEmergencyState extends LoginEmergencyState {
  final String message;

  LoginSuccessEmergencyState({required this.message});
}

final class LoginErrorEmergencyState extends LoginEmergencyState {
  final String errorMessage;

  LoginErrorEmergencyState({required this.errorMessage});
}
