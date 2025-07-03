import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/data/repo/auth_repo_emergency.dart';
import 'package:user_accident/core/logic/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this.authRepoEmergency) : super(LogoutInitial());
  final AuthRepoEmergency authRepoEmergency;

  Future<void> logout() async {
  final result = await authRepoEmergency.logout();

  result.fold(
    (error) => emit(LogoutError(errorMessage: error)),
    (message) async {
      await Future.wait([
        CacheHelper().removeData(key: ApiKeys.token),
        CacheHelper().removeData(key: ApiKeys.id),
        CacheHelper().removeData(key: 'lat'),
        CacheHelper().removeData(key: 'lng'),
        CacheHelper().removeData(key: 'userType'),
        CacheHelper().removeData(key: 'emergency_profile'),
      ]);

      emit(LogoutSuccessState());
    },
  );
}
}
