// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/core/base/base_model.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends BaseModel<RegisterRequestModel> {
  final String? username;
  final String? email;
  final String? password;
  @JsonKey(
    includeToJson: false,
    includeFromJson: false,
  )
  late final MultipartFile? profileImage;

  RegisterRequestModel({
    this.username,
    this.email,
    this.password,
    File? image,
  });
  @override
  Map<String, dynamic> toJson() {
    return _$RegisterRequestModelToJson(this);
  }

  @override
  RegisterRequestModel fromJson(Map<String, dynamic> json) {
    return _$RegisterRequestModelFromJson(json);
  }

  @override
  List<Object?> get props => [username, email, password, profileImage];

  RegisterRequestModel copyWith({
    String? username,
    String? email,
    String? password,
    MultipartFile? profileImage,
  }) {
    return RegisterRequestModel(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
