class UserProfileResponse {
  String? username;
  String? email;
  String? profileImage;

  UserProfileResponse({this.username, this.email, this.profileImage});

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
