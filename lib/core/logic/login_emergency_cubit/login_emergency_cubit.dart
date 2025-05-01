import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/data/model/model.dart';
import 'package:user_accident/core/data/repo/auth_repo_emergency.dart';

part 'login_emergency_state.dart';

class LoginEmergencyCubit extends Cubit<LoginEmergencyState> {
  LoginEmergencyCubit(this.authRepoEmergency) : super(LoginEmergencyInitial());

  final AuthRepoEmergency authRepoEmergency;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  LoginModel? loginModel;

  void login() async {
    emit(LoginLoadingEmergencyState());

    final result = await authRepoEmergency.login(
        email: emailController.text, password: passwordController.text);

    result.fold((l) => emit(LoginErrorEmergencyState(errorMessage: l)),
        (r) async {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(r.token);
      final lat = r.data['location']['coordinates'][0];
      final lng = r.data['location']['coordinates'][1];
      final emergencyType = r.data['emergencyType'];

      await CacheHelper().saveData(key: ApiKeys.token, value: r.token);
      await CacheHelper()
          .saveData(key: ApiKeys.id, value: decodedToken[ApiKeys.id]);

      CacheHelper().saveData(key: 'lat', value: lat);
      CacheHelper().saveData(key: 'lng', value: lng);
      await CacheHelper().saveData(key: 'userType', value: emergencyType);

      
      loginModel = r;
      emit(LoginSuccessEmergencyState(message: r.message));
    });
  }
}
