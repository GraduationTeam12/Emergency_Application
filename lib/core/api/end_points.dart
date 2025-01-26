class EndPoint {
  static const String baseUrl = 'https://satars.onrender.com/';
  static const String logIn = 'users/login';
  static const String forgotPassword = 'users/forgotPass';
  static const String sendCode = 'users/verifyOtp';
  static const String changeForgottenPassword =
      'users/resetPassword';
  static const String emergencyLogin = 'emergencies/login';
 

   
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
