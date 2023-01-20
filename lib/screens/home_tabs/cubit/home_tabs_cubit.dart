import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_tabs_state.dart';

class HomeTabsCubit extends Cubit<HomeTabsState> {
  final List<HomeTabsState> _previousStates = [];
  HomeTabsCubit(HomeTabItem initialTab) : super(HomeTabsState(tab: initialTab));

  void setTab(HomeTabItem tab) {
    _previousStates.add(state);
    emit(HomeTabsState(tab: tab));
  }

  void goBack() {
    if (_previousStates.isNotEmpty) {
      emit(_previousStates.removeLast());
    }
  }

  bool canGoBack() => _previousStates.isNotEmpty;
}
