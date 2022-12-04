import 'package:achilleservice/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/theme.dart';
import 'screens/home/cubit/config_cubit.dart';

void main() {
  Bloc.observer = ThemeBlocObserver();
  runApp(const ServiceApp());
}

class ServiceApp extends StatelessWidget {
  const ServiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => ConfigCubit(),
        ),
      ],
      child: const HomePage(),
    );
  }
}
