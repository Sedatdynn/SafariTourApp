import 'package:dio/dio.dart';
import 'package:safari_tour_app/feature/login/model/login_request_model.dart';
import '../../../product/enums/requestsPath/accounts_requests.dart';
import '../../../product/extension/requestsPath/accounts_requests.dart';

abstract class ILoginService {
  ILoginService(this.dio);
  final Dio dio;
  final loginPath = IAccountPath.login.rawValue;

  Future<bool?> postUserLogin(
    LoginRequestModel loginData,
  );
}
