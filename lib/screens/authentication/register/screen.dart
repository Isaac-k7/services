import 'package:achilleservice/cubits/cubit/show_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/cubit/register_cubit.dart';
import 'widgets/body.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => ShowPasswordCubit(),
          ),
        ],
        child: const Body(),
      ),
    );
  }
}
