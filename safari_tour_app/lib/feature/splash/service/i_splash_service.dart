import 'package:dio/dio.dart';

import '../../../product/enums/requestsPath/accounts_requests.dart';
import '../../../product/extension/requestsPath/accounts_requests.dart';
import '../model/user_response_model.dart';

abstract class ISplashService {
  ISplashService(this.dio);
  final Dio dio;
  final profilePath = IAccountPath.profile.rawValue;

  Future<UserProfileResponse?> checkUserToken(Map<String, dynamic> accessToken);
}
