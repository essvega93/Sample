import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:match_me/data/api/api_service.dart';
import 'package:match_me/data/repositories/auth_repository.dart';

import '../../shared/Log.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final authRepository = Injector.appInstance.get<AuthRepository>();

  AuthBloc(AuthState initialState) : super(initialState);

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginUser) {
      try {
        yield LoginState(ApiStatus.LOADING);
        final response =
            await authRepository.loginCall(loginRequest: event.request);
        if (response.responseCode == "200") {
          yield LoginState(ApiStatus.SUCCESS, response: response);
        } else {
          Log.v("ERROR DATA ::: ${response.responseMessage}");
          yield LoginState(ApiStatus.ERROR, error: response.status);
        }
      } catch (e) {
        Log.v("ERROR DATA catch bloc: ${e}");
        yield LoginState(ApiStatus.ERROR, error: 'Something went wrong');
      }
    } else if (event is SignUp) {
      try {
        yield SignUpState(ApiStatus.LOADING);
        final response =
            await authRepository.signUpCall(loginRequest: event.request);
        if (response.responseCode == "200") {
          yield SignUpState(ApiStatus.SUCCESS, response: response);
        } else {
          Log.v("error ::: ${response.responseMessage}");
          yield SignUpState(ApiStatus.ERROR, error: response.responseMessage);
        }
      } catch (e) {
        Log.v("Catch bloc: ${e}");
        yield SignUpState(ApiStatus.ERROR, error: 'Something went wrong');
      }
    }
  }
}
