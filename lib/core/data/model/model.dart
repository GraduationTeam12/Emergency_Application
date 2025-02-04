import 'package:user_accident/core/api/end_points.dart';

class LoginModel {
  final String message;
  final String token;
  final dynamic data;

  LoginModel({
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
        message: jsonData[ApiKeys.message], token: jsonData[ApiKeys.token] , data: jsonData['data']);
  }
}
