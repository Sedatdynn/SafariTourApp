import 'package:json_annotation/json_annotation.dart';
part "login_response_model.g.dart";

@JsonSerializable()
class LoginResponseModel {
  String? access;
  String? refresh;

  LoginResponseModel({this.access, this.refresh});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
