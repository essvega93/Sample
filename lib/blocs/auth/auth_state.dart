
import '../../data/api/api_service.dart';
import '../../data/models/response/auth/login_response.dart';

abstract class AuthState {
  AuthState([List states = const []]) : super();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

//create initial State
class AuthInitial extends AuthState {
  AuthInitial() : super([]);
}

//create state
class LoginState extends AuthState {
  ApiStatus state;

  ApiStatus get apiState => state;
  LoginResponse? response;
  String? error;

  LoginState(this.state, {this.response, this.error});
}

class SignUpState extends AuthState {
  ApiStatus state;

  ApiStatus get apiState => state;
  LoginResponse? response;
  String? error;

  SignUpState(this.state, {this.response, this.error});
}