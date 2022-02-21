class LoginRequest {
  String? username;
  String? firstName;
  String? password;

  LoginRequest({this.password, this.username, this.firstName});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    firstName = json['fullname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['fullname'] = firstName;
    return data;
  }
}
