import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/core/data/repo/auth_repo.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_state.dart';
import 'package:user_accident/presentation/widgets/forgot_password_by_email_field.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepository) : super(ForgotPasswordInitial());

  final AuthRepository authRepository;
  GlobalKey<FormState> sendCodeKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  

  void sendCode() async {
    emit(SendCodeLoading());

    final res = await authRepository.sendCode(emailController.text);
    res.fold((l) => emit(SendCodeError(l)), (r) => emit(SendCodeSucess(r)));
  }


  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> verifyCodeKey = GlobalKey();

  void verifyCode() async {
    emit(VerifyCodeLoading());

    final res = await authRepository.verifyCode(codeController.text);
    res.fold(
        (l) => emit(VerifyCodeError(l)), (r) => emit(VerifyCodeSuccess(r)));
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> resetPasswordKey = GlobalKey();

  void resetPassword() async {
    emit(ResetPasswordLoading());

    final res = await authRepository.resetPassword(
      email: ForgotPasswordEmailFieldState.email,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
    );
    res.fold((l) => emit(ResetPasswordError(l)),
        (r) => emit(ResetPasswordSuccess(r)));
  }
}
