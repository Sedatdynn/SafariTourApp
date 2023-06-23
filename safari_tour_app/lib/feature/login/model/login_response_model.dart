import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/core/base/base_model.dart';
part "login_response_model.g.dart";

@JsonSerializable()
class LoginResponseModel extends BaseModel<LoginResponseModel> {
  final String? access;
  final String? refresh;

  LoginResponseModel({this.access, this.refresh});

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  List<Object?> get props => [access, refresh];
}
