class EndPoint {
  static const String baseUrl = 'https://satars.onrender.com/';
  static const String emergencyLogin = 'api/v1/emergencies/login';
  static const String emergencyInfo = 'api/v1/emergencies/';
 

   static String getEmergency(id) {
    return "$emergencyInfo$id";
  }
}

class ApiKeys {
  static const String id = 'id';
  static const String email = 'email';
  static const String password = 'password';
  static const String confirmPassword = 'passwordConfirm';
  static const String code = 'otp';
  static const String message = 'msg';
  static const String token = 'token';
}
