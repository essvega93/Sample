import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';

import '../../data/repositories/home_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final homeRepository = Injector.appInstance.get<HomeRepository>();

  HomeBloc(HomeState initialState) : super(initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {

  }
}
