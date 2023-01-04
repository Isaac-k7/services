import 'package:achilleservice/cubits/cubit/show_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/login_cubit.dart';
import 'widgets/body.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ShowPasswordCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
        ],
        child: const Body(),
      ),
    );
  }
}
