 
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutSuccessState extends LogoutState {}

final class LogoutError extends LogoutState {
  final String errorMessage;
  LogoutError({required this.errorMessage});
}
