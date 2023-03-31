import 'dart:io';
import 'package:dio/dio.dart';
import 'package:safari_tour_app/feature/splash/model/user_response_model.dart';
import 'i_splash_service.dart';

class SplashService extends ISplashService {
  SplashService(super.dio, super.item);

  @override
  Future<UserPrfoileResponse?> postUserToken(
    Map<String, dynamic> accessToken,
  ) async {
    try {
      final response = await dio.get(
        item,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${accessToken['token']}',
          },
        ),
      );
      if (response.statusCode == HttpStatus.ok) {
        return UserPrfoileResponse.fromJson(response.data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
