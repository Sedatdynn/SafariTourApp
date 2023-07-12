import 'dart:io';

import 'package:safari_tour_app/feature/login/model/login_request_model.dart';

import '../../../core/cache/shared_manager.dart';
import '../model/login_response_model.dart';
import 'i_login_service.dart';

class LoginService extends ILoginService {
  LoginService(super.dio);

  @override
  Future<bool?> postUserLogin(
    LoginRequestModel loginData,
  ) async {
    try {
      final response = await dio.post(loginPath, data: loginData.toJson());
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final tok = LoginResponseModel().fromJson(jsonBody);
          await SharedManager.instance.setString(SharedKeys.access, tok.access!);
          await SharedManager.instance.setString(SharedKeys.refresh, tok.refresh!);
          return true;
        }
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
