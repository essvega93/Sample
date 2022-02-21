
import 'package:match_me/data/models/request/auth/login_request.dart';

import '../../data/models/request/auth/signup_request.dart';

abstract class AuthEvent {
  AuthEvent([List event = const []]) : super();
}

class LoginUser extends AuthEvent {
  final LoginRequest request;

  LoginUser({required this.request}) : super([request]);

  @override
  List<Object> get props => throw UnimplementedError();
}

class SignUp extends AuthEvent {
  final SignUpRequest request;

  SignUp({required this.request}) : super([request]);

  @override
  List<Object> get props => throw UnimplementedError();
}
