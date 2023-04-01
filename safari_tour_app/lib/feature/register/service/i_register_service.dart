import 'package:dio/dio.dart';

import '../../../product/enums/requestsPath/accounts_requests.dart';
import '../../../product/extension/requestsPath/accounts_requests.dart';

abstract class IRegisterService {
  IRegisterService(this.dio);
  final Dio dio;
  final registerPath = IAccountPath.register.rawValue;

  Future<bool?> postUserRegister(Map<String, dynamic> registerData);
}
