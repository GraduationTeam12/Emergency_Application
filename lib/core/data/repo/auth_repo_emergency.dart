// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:user_accident/core/api/api_consumer.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/data/model/emergency_profile_model.dart';
import 'package:user_accident/core/data/model/model.dart';
import 'package:user_accident/core/error/exception_response.dart';
import 'package:user_accident/core/error/exceptions.dart';

class AuthRepoEmergency {
  final ApiConsumer apiConsumer;
  AuthRepoEmergency({
    required this.apiConsumer,
  });

  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        EndPoint.emergencyLogin,
        data: {ApiKeys.email: email, ApiKeys.password: password},
      );
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } on ServerExceptionResponse catch (error) {
      return Left(error.errorResponse.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, EmergencyProfileModel>> getEmergencyProfile() async {
    String id = CacheHelper().getData(key: 'id');
    String token = CacheHelper().getData(key: 'token');

    try {
      final response = await apiConsumer.get(
        EndPoint.getEmergency(id),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      
      final EmergencyProfileModel emergencyProfile =
          EmergencyProfileModel.fromJson(response['data']);
      
      return Right(emergencyProfile);
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    } on ServerExceptionResponse catch (error) {
      return Left(error.errorResponse.errorMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
