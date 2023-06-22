import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/core/base/base_model.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends BaseModel<LoginRequestModel> {
  LoginRequestModel({
    required this.username,
    required this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestModelFromJson(json);
  }
  final String? username;
  final String? password;

  @override
  Map<String, dynamic> toJson() {
    return _$LoginRequestModelToJson(this);
  }

  @override
  List<Object?> get props => [username, password];

  LoginRequestModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginRequestModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }
}
