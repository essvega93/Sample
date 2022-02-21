
abstract class HomeState {
  HomeState([List states = const []]) : super();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

//create initial State
class HomeInitial extends HomeState {
  HomeInitial() : super([]);
}
