import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register/cubit/register_cubit.dart';
import 'widgets/body.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const Body(),
      ),
    );
  }
}
