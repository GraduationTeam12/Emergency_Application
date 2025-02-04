import 'package:user_accident/core/data/model/emergency_profile_model.dart';

sealed class EmergenciesFeaturesState {}

final class EmergenciesFeaturesInitial extends EmergenciesFeaturesState {}

final class EmergencyProfileLoading extends EmergenciesFeaturesState {}

final class EmergencyProfileSuccess extends EmergenciesFeaturesState {
  final EmergencyProfileModel emergency;

  EmergencyProfileSuccess(this.emergency);
}

final class EmergencyProfileUpdated extends EmergenciesFeaturesState {
  final EmergencyProfileModel emergency;

  EmergencyProfileUpdated(this.emergency);
}

final class EmergencyProfileError extends EmergenciesFeaturesState {
  final String message;

  EmergencyProfileError(this.message);
}
