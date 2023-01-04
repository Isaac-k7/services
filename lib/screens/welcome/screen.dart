import 'package:achilleservice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:achilleservice/config/constants.dart';
import 'package:achilleservice/config/theme/theme.dart';
import 'package:achilleservice/utils/utils.dart';
import 'cubit/config_cubit.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var  controller = RouteController();
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return Scaffold(
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
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 150),
                    child: Column(
                      children: [
                        const Text(
                          'Bienvenue',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Rubik',
                          ),
                        ),
                        const SizedBox(height: 30),
                        CustomElevatedButton(
                          color: AppTheme.colorScheme.secondary,
                          backgroundColor: AppTheme.colorScheme.primary,
                          label: const Text("Login",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          onPressed: (){controller.login(context);},
                        ),
                        const SizedBox(height: 15),
                        CustomOutlinedButton(
                          color: Colors.black,
                          label: const Text(
                            "S'inscrire",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          onPressed: (){controller.register(context);},
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Home'),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              BlocBuilder<ConfigCubit, bool>(
                builder: (context, isShow) {
                  if (isShow) {
                    return Positioned(
                      right: 10,
                      bottom: 120,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
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
              ),
            ],
          ),
        );
      },
    );
  }
}
