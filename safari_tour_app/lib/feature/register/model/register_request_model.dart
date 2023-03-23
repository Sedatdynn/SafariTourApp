import 'package:json_annotation/json_annotation.dart';
part "register_request_model.g.dart";

@JsonSerializable()
class RegisterRequestModel {
  String? username;
  String? password;

  RegisterRequestModel({this.username, this.password});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RegisterRequestModelToJson(this);
  }
}
