class SignUpRequest {
  String? email;
  String? firstName;
  String? lastName;
  String? apikey;
  String? apisecret;
  int? membership_level_id;
  String? password;

  SignUpRequest(
      {this.password,
      this.email,
      this.firstName,
      this.lastName,
      this.apikey = "8umk3ghctp",
      this.apisecret = "0xu01h9n0c",
      this.membership_level_id = 19});

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    apikey = json['apikey'];
    apisecret = json['apisecret'];
    membership_level_id = json['membership_level_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['apikey'] = apikey;
    data['apisecret'] = apisecret;
    data['membership_level_id'] = membership_level_id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;

    return data;
  }
}
