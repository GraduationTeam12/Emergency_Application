// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/data/model/model.dart';
import 'package:user_accident/core/data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepository authRepo;
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  LoginModel? loginModel;
  void login() async {
    emit(LoginLoadingState());

    final result = await authRepo.login(
        email: signInEmail.text, password: signInPassword.text);

    result.fold((l) => emit(LoginErrorState(errMsg: l)), (r) async {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      await CacheHelper().saveData(key: ApiKeys.token, value: r.token);
      await CacheHelper()
          .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);

      loginModel = r;
      emit(LoginSuccessState(message: r.message));
    });
  }

   
}
