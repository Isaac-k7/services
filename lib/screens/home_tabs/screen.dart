import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_tabs_cubit.dart';
import 'widgets/body.dart';

class HomeBasePage extends StatelessWidget {
  final RouteSettings _initialSettings;

  const HomeBasePage({Key? key, required RouteSettings initialSettings})
      : _initialSettings = initialSettings,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeTabsCubit(
        HomeTabItem.values.firstWhere(
          (element) => '/${element.name}' == _initialSettings.name,
          orElse: () => HomeTabItem.home,
        ),
      ),
      child: const Body(),
    );
  }
}
