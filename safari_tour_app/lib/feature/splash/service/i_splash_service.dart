import 'package:dio/dio.dart';
import 'package:safari_tour_app/feature/splash/model/user_response_model.dart';

abstract class ISplashService {
  ISplashService(this.dio, this.item);
  final Dio dio;
  String item;

  Future<UserPrfoileResponse?> postUserToken(Map<String, dynamic> accessToken);
}
