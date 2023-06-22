import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/core/base/base_model.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserProfileResponse extends BaseModel<UserProfileResponse> {
  final String? username;
  final String? email;
  final String? profileImage;

  UserProfileResponse({this.username, this.email, this.profileImage});

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$UserProfileResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileResponseToJson(this);
  }

  @override
  UserProfileResponse fromJson(Map<String, dynamic> json) {
    return fromJson(json);
  }

  @override
  List<Object?> get props => [username, email, profileImage];

  UserProfileResponse copyWith({
    String? username,
    String? email,
    String? profileImage,
  }) {
    return UserProfileResponse(
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
