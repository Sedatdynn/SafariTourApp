// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/core/base/base_model.dart';

part "login_response_model.g.dart";

@JsonSerializable()
class LoginResponseModel extends BaseModel<LoginResponseModel> {
  final String? access;
  final String? refresh;

  LoginResponseModel({this.access, this.refresh});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props => [access, refresh];

  LoginResponseModel copyWith({
    String? access,
    String? refresh,
  }) {
    return LoginResponseModel(
      access: access ?? this.access,
      refresh: refresh ?? this.refresh,
    );
  }
}
