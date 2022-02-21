import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:match_me/pages/splash_screen.dart';
import 'package:match_me/shared/strings_constant.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/auth/auth_state.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/home/home_state.dart';
import 'dependency_injections.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjections();
  _portraitModeOnly();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              AuthInitial(),
            )),
        BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              HomeInitial(),
            )),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConst.APP_TITLE,
        home: SplashScreen(),
      ),
    );
  }
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
