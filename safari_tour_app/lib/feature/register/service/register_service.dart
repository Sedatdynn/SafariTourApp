import 'dart:io';

import 'package:dio/dio.dart';
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
      final formData = FormData.fromMap({
        "username": registerData["username"],
        "email": registerData["email"],
        "password": registerData["password"],
        "profile_image":
            await MultipartFile.fromFile(registerData["profile_image"]),
      });

      final response = await dio.post(item, data: formData);
      if (response.statusCode == HttpStatus.created) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          final token = LoginResponseModel.fromJson(jsonBody);
          prefs.setString("access", token.access!);
          prefs.setString("refresh", token.refresh!);
          return true;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
