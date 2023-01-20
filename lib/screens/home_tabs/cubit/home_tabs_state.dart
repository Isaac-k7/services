part of 'home_tabs_cubit.dart';

enum HomeTabItem { favorites, notifications, home, profile, settings }

class HomeTabsState extends Equatable {
  const HomeTabsState({
    this.tab = HomeTabItem.home,
  });

  final HomeTabItem tab;

  @override
  List<Object> get props => [tab];
}
