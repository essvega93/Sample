class LoginResponse {
  String? responseCode;
  dynamic responseMessage;
  ResponseData? responseData;
  String? status;

  LoginResponse(
      {this.status,
      this.responseCode,
      this.responseMessage,
      this.responseData});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    status = json['status'];
    responseMessage = json['response_message'];
    responseData = json['response_data'] != null
        ? ResponseData.fromJson(json['response_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['response_message'] = responseMessage;
    if (responseData != null) {
      data['response_data'] = responseData?.toJson();
    }
    return data;
  }
}

class ResponseData {
  int? memberId;
  String? firstName;
  String? lastName;

  ResponseData(
      {this.memberId,
      this.firstName,
      this.lastName,
      });

  ResponseData.fromJson(Map<String, dynamic> json) {
    memberId = json['member_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = memberId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}