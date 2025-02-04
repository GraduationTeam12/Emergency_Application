import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/logic/logout_cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    await CacheHelper().removeData(key: ApiKeys.token);
    CacheHelper().removeData(key: 'lat');
    CacheHelper().removeData(key: 'lng');
    emit(LogoutSuccessState());
    
  }
}
