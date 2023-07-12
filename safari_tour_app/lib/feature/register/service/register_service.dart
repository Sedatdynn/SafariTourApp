import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/cache/shared_manager.dart';
import '../../login/model/login_response_model.dart';
import 'i_register_service.dart';

class RegisterService extends IRegisterService {
  RegisterService(super.dio);

  @override
  Future<bool?> postUserRegister(
    Map<String, dynamic> registerData,
  ) async {
    try {
      final formData = FormData.fromMap({
        "username": registerData["username"],
        "email": registerData["email"],
        "password": registerData["password"],
        "profile_image": await MultipartFile.fromFile(registerData["profile_image"] ?? ""),
      });

      final response = await dio.post(registerPath, data: formData);
      if (response.statusCode == HttpStatus.created) {
        final jsonBody = await response.data;
        if (jsonBody is Map<String, dynamic>) {
          final token = LoginResponseModel().fromJson(jsonBody);
          await SharedManager.instance.setString(SharedKeys.access, token.access!);
          await SharedManager.instance.setString(SharedKeys.refresh, token.refresh!);
          return true;
        }
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
