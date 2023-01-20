import 'package:flutter/material.dart';
import 'package:achilleservice/blocs/bloc.dart';
import 'package:achilleservice/screens/splash/controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: ((context, state) {
        if (state is AuthenticationStateAuthenticated) {
          Controller.navigateToHome(context);
        }
        if (state is AuthenticationStateUnauthenticated) {
          Controller.navigateToWelcome(context);
        }
      }
      ),
      child: Container(
        key: const Key('container-splash-screen'),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash/splash_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: null,
      ),
    );
  }
}
