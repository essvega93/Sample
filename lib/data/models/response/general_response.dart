class GeneralResponse {
  GeneralResponse({Map<String, dynamic>? json, this.message, required this.success});

  String? message;
  String? error;
  bool success = true;

  GeneralResponse.fromJson(Map<String, dynamic> json, this.success) {
    message = json.containsKey("message") ? json["message"] : null;
    error = json.containsKey("error") ? json["error"] : null;
  }
}
