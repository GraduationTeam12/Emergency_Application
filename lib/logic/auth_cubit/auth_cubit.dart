// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> signInWithEmailAndPassword(TextEditingController emailController,
      TextEditingController passwordController) async {
    emit(Loading());

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      emit(SuccessfullyLogin());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ErrorOccured(errMsg: e.toString()));
      } else if (e.code == 'wrong-password') {
        emit(ErrorOccured(errMsg: e.toString()));
      } else {
        emit(ErrorOccured(errMsg: e.toString()));
      }
    }
  }
}
