import 'dart:io';

import 'package:safari_tour_app/feature/login/model/login_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        SharedPreferences prefs = await SharedPreferences.getInstance();

        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final tok = LoginResponseModel().fromJson(jsonBody);
          prefs.setString("access", tok.access!);
          prefs.setString("refresh", tok.refresh!);
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
