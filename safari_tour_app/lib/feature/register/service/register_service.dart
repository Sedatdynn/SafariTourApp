import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../../login/model/login_response_model.dart';
import 'i_register_service.dart';

class RegisterService extends IRegisterService {
  RegisterService(super.dio, super.item);

  @override
  Future<bool?> postUserRegister(
    Map<String, dynamic> registerData,
  ) async {
    try {
      print("REsponse");
      final response = await dio.post(item, data: {
        "username": registerData["username"],
        "password": registerData["password"],
      });
      print("Response" + response.toString());
      if (response.statusCode == HttpStatus.created) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final jsonBody = response.data;
        print("********" + jsonBody.toString());
        if (jsonBody is Map<String, dynamic>) {
          final token = LoginResponseModel.fromJson(jsonBody);
          prefs.setString("access", token.access!);
          prefs.setString("refresh", token.refresh!);
          return true;
        }
      }
      print("false");
      return false;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
