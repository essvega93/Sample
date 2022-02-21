import 'package:dio/dio.dart';

import '../../shared/Log.dart';

class ApiResponse<T> {
  int? code;
  dynamic body;
  DioError? error;
  bool? success = false;

  ApiResponse.success(Response<T> response) {
    code = response.statusCode ?? 0;
    body = response.data ?? "" as T;
    success = true;
  }

  ApiResponse.failure(dynamic e) {
    error = e;
    code = e.response?.statusCode;
    if (e is DioError) {
      body = e.response?.data;
      Log.v("Error = ${e.response?.data}");
      Log.v("Error Code = ${e.response?.statusCode}");
    }
  }
}
