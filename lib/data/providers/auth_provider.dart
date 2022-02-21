import 'package:dio/dio.dart';
import 'package:match_me/shared/strings_constant.dart';

import '../../shared/Log.dart';
import '../../shared/utility.dart';
import '../api/api_constants.dart';
import '../api/api_response.dart';
import '../api/api_service.dart';
import '../models/request/auth/login_request.dart';
import '../models/request/auth/signup_request.dart';

class AuthProvider {
  AuthProvider({required this.api});

  ApiService api;

  Map<String, dynamic> get defaultParams => {
        "key": api.env.apiKey, // all
      };

  Future<ApiResponse>? loginCall({required LoginRequest request}) async {
    Utility.hideKeyboard();
    try {
      final response = await api.dio.get(
          "${ApiConstants.LOGIN}username=${request.username}&password=${request.password}",
          options: Options(
              method: 'GET',
              contentType: "application/json",
              responseType: ResponseType.json // or ResponseType.JSON
              ));
      return ApiResponse.success(response);
    } catch (e) {
      return ApiResponse.failure(e);
    }
  }

  Future<ApiResponse>? signUpCall({required SignUpRequest request}) async {
    Utility.hideKeyboard();
    try {
      Log.v("Response : ${request.toJson()}");
      final response = await api.dio.post(
        ApiConstants.SIGN_UP,
        data: FormData.fromMap(request.toJson()),
        options: Options(
            method: 'POST',
            contentType: 'application/x-www-form-urlencoded',
            responseType: ResponseType.json),
      );
      return ApiResponse.success(response);
    } catch (e) {
      return ApiResponse.failure(e);
    }
  }
}
