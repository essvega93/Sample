import 'dart:convert';

import '../../shared/Preference.dart';
import '../../shared/user_session.dart';
import '../models/request/auth/login_request.dart';
import '../models/request/auth/signup_request.dart';
import '../models/response/auth/login_response.dart';
import '../providers/auth_provider.dart';

class AuthRepository {
  AuthRepository({required this.authProvider});

  final AuthProvider authProvider;

  Future<LoginResponse> loginCall({required LoginRequest loginRequest}) async {
    final response = await authProvider.loginCall(request: loginRequest);
    if (response?.success == true) {
      LoginResponse _response =
          LoginResponse.fromJson(json.decode(response?.body));
      if (_response.responseCode == "201") return _response;
      Preference.setInt(
          Preference.USER_ID, _response.responseData?.memberId ?? 0);
      return _response;
    } else {
      return LoginResponse(
          responseData: null, responseMessage: 'Something went wrong');
    }
  }

  Future<LoginResponse> signUpCall(
      {required SignUpRequest loginRequest}) async {
    final response = await authProvider.signUpCall(request: loginRequest);
    if (response?.success == true) {
      LoginResponse _response =
          LoginResponse.fromJson(json.decode(response?.body));
      if (_response.responseCode == "201") return _response;
      Preference.setInt(
          Preference.USER_ID, _response.responseData?.memberId ?? 0);
      return _response;
    } else {
      return LoginResponse(
          responseData: null, responseMessage: 'Something went wrong');
    }
  }
}
