import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/data/repo/auth_repo_emergency.dart';
import 'package:user_accident/core/logic/emergencies_features/emergencies_features_state.dart';

class EmergenciesFeaturesCubit extends Cubit<EmergenciesFeaturesState> {
  EmergenciesFeaturesCubit(
    this.authRepoEmergency,
  ) : super(EmergenciesFeaturesInitial());

  final AuthRepoEmergency authRepoEmergency;
  final String token = CacheHelper().getData(key: 'token');

  bool _areTheSameData(dynamic oldData, dynamic newData) {
    if ( 
        oldData.name != newData.name ||
        oldData.email != newData.email ||
        oldData.address != newData.address ||
        oldData.phone != newData.phone) {
      return false;
    }
    return true;
  }

  void getEmergencyProfile() async {
    emit(EmergencyProfileLoading());

    final cachedData = CacheHelper().getData(key: 'emergency_profile');

    if (cachedData != null) {
      emit(EmergencyProfileSuccess(cachedData));
    }
    final res = await authRepoEmergency.getEmergencyProfile();

    res.fold((l) => emit(EmergencyProfileError(l)), (r) async {
      if (cachedData != null) {
        if (!_areTheSameData(cachedData, r)) {
          await CacheHelper().saveData(key: 'emergency_profile', value: r);
          emit(EmergencyProfileUpdated(r));
          return;
        } else if (cachedData != null && _areTheSameData(cachedData, r)) {
          return;
        }
      }

      await CacheHelper().saveData(key: 'emergency_profile', value: r);
      emit(EmergencyProfileSuccess(r));
    });
  }

  Future<void> clearEmergencyProfileCache() async {
    await CacheHelper().removeData(key: 'emergency_profile');
  }
}
