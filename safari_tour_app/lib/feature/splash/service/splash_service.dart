import 'dart:io';
import 'package:dio/dio.dart';
import 'package:safari_tour_app/feature/splash/model/user_response_model.dart';
import 'i_splash_service.dart';

class SplashService extends ISplashService {
  SplashService(super.dio);

  @override
  Future<UserProfileResponse?> checkUserToken(
    Map<String, dynamic> accessToken,
  ) async {
    try {
      final response = await dio.get(
        profilePath,
        options: Options(
          headers: {'Authorization': 'Bearer ${accessToken['token']}'},
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return UserProfileResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
