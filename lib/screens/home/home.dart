import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:achilleservice/config/constants.dart';
import 'package:achilleservice/config/theme/theme.dart';

import 'cubit/config_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: Scaffold(
            floatingActionButton: BlocBuilder<ConfigCubit, bool>(
              builder: (context, isShow) {
                return FloatingActionButton(
                    child: const Icon(
                      Icons.settings,
                      size: 40,
                    ),
                    onPressed: () {
                      context.read<ConfigCubit>().changeValue(isShow);
                    });
              },
            ),
            appBar: AppBar(
              title: const Text('Service home'),
            ),
            body: Stack(
              children: [
                BlocBuilder<ConfigCubit, bool>(
                  builder: (context, isShow) {
                    if (isShow) {
                      return Positioned(
                        right: 10,
                        bottom: 120,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(35)),
                          height: 150,
                          width: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppChangeTheme(
                                  color: AppColors.kPrimaryColor,
                                  onPressed: () {
                                    context
                                        .read<ThemeCubit>()
                                        .changeTheme(AppTheme.defaultTheme);
                                  }),
                              AppChangeTheme(
                                  color: AppColors.kSecondaryColor,
                                  onPressed: () {
                                    print('dsds');
                                    context
                                        .read<ThemeCubit>()
                                        .changeTheme(AppTheme.darkTheme);
                                  }),
                            ],
                          ),
                        ),
                      );
                    }
                    return const Center();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Widget _palette_color(Color _color) {
  //   return SizedBox(
  //     height: 70,
  //     width: 70,
  //     child: IconButton(
  //         onPressed: () {},
  //         icon: Card(
  //           color: _color,
  //           elevation: 10,
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
  //           child: const SizedBox(
  //             width: 70,
  //             height: 70,
  //           ),
  //         )),
  //   );
  // }
}
