import 'package:dio/dio.dart';

abstract class ILoginService {
  ILoginService(this.dio, this.item);
  final Dio dio;
  String item;

  Future<bool?> postUserLogin(Map<String, dynamic> loginData);
}
