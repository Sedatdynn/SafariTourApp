import 'package:json_annotation/json_annotation.dart';
part "login_request_model.g.dart";

@JsonSerializable()
class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({this.username, this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestModelToJson(this);
  }
}
