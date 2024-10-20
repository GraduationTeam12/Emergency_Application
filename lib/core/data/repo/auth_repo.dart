import 'package:dartz/dartz.dart';
import 'package:user_accident/core/api/api_consumer.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/data/model/model.dart';
import 'package:user_accident/core/error/exceptions.dart';

class AuthRepository {
  final ApiConsumer apiConsumer;

  AuthRepository({required this.apiConsumer});

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.logIn,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  Future<Either<String, String>> sendCode(String email) async {
    try {
      final response = await apiConsumer
          .post(EndPoint.forgotPassword, data: {ApiKeys.email: email});
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> verifyCode(String code) async {
    try {
      final response =
          await apiConsumer.post(EndPoint.sendCode, data: {ApiKeys.code: code});
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, String>> resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response =
          await apiConsumer.patch(EndPoint.changeForgottenPassword, data: {
        ApiKeys.email: email,
        ApiKeys.password: password,
        ApiKeys.confirmPassword: confirmPassword,
      });
      return Right(response[ApiKeys.message]);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
