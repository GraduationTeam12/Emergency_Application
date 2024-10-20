sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class SendCodeLoading extends ForgotPasswordState {}

final class SendCodeSucess extends ForgotPasswordState {
  final String message;

  SendCodeSucess(this.message);
}

final class SendCodeError extends ForgotPasswordState {
  final String errMessage;

  SendCodeError(this.errMessage);
}

final class VerifyCodeLoading extends ForgotPasswordState {}

final class VerifyCodeSuccess extends ForgotPasswordState {
  final String message;

  VerifyCodeSuccess(this.message);
}

final class VerifyCodeError extends ForgotPasswordState {
  final String errMessage;

  VerifyCodeError(this.errMessage);
}

final class ResetPasswordLoading extends ForgotPasswordState {}

final class ResetPasswordSuccess extends ForgotPasswordState {
  final String message;

  ResetPasswordSuccess(this.message);
}

final class ResetPasswordError extends ForgotPasswordState {
  final String errMessage;

  ResetPasswordError(this.errMessage);
}
