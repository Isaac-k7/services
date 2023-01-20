import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:achilleservice/screens/screens.dart';

import '../cubit/home_tabs_cubit.dart';

final Map<HomeTabItem, Widget> tabPages = {};

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedTab =
        context.select((HomeTabsCubit cubit) => cubit.state.tab);
    _verifyAndCreate(selectedTab);

    return WillPopScope(
      onWillPop: () async {
        HomeTabsCubit cubit = context.read<HomeTabsCubit>();
        if (cubit.canGoBack()) {
          cubit.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildOffstageTab(
              HomeTabItem.favorites,
              selectedTab == HomeTabItem.favorites,
            ),
            _buildOffstageTab(
              HomeTabItem.notifications,
              selectedTab == HomeTabItem.notifications,
            ),
            _buildOffstageTab(
              HomeTabItem.home,
              selectedTab == HomeTabItem.home,
            ),
            _buildOffstageTab(
              HomeTabItem.profile,
              selectedTab == HomeTabItem.profile,
            ),
            _buildOffstageTab(
              HomeTabItem.settings,
              selectedTab == HomeTabItem.settings,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
          currentIndex: selectedTab.index,
          onTap: (int tabIndex) {
            if (selectedTab.index != tabIndex) {
              context
                  .read<HomeTabsCubit>()
                  .setTab(HomeTabItem.values[tabIndex]);
            }
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  Widget _buildOffstageTab(HomeTabItem tabItem, bool isActive) {
    return Offstage(
      offstage: !isActive,
      child: tabPages[tabItem],
    );
  }

  void _verifyAndCreate(HomeTabItem tabItem) {
    if (tabPages[tabItem] != null) {
      return;
    }
    if (tabItem == HomeTabItem.home) {
      tabPages[tabItem] = const Home();
    } else if (tabItem == HomeTabItem.notifications) {
      tabPages[tabItem] = const NotificationsPage();
    } else if (tabItem == HomeTabItem.favorites) {
      tabPages[tabItem] = const FavoritesPage();
    } else if (tabItem == HomeTabItem.profile) {
      tabPages[tabItem] = const Profile();
    } else if (tabItem == HomeTabItem.settings) {
      tabPages[tabItem] = const SettingsPage();
    }
  }
}
