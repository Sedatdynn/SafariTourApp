import 'package:dio/dio.dart';

abstract class IRegisterService {
  IRegisterService(this.dio, this.item);
  final Dio dio;
  String item;

  Future<bool?> postUserRegister(Map<String, dynamic> registerData);
}
